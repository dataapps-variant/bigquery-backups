"""Wraps the BigQuery, BigQuery Data Transfer, and Dataform APIs to fetch
the objects this project backs up: views, routines (procedures/functions),
scheduled queries, and BigQuery Studio saved queries. Every call here is
read-only — nothing in BigQuery is ever created, modified, or deleted.

Saved queries aren't exposed by the BigQuery API itself — BigQuery Studio
stores each one as its own single-file Dataform "repository" behind the
scenes (marked with a `single-file-asset-type: sql` label), which is why
this needs the Dataform client rather than the BigQuery one.
"""
from __future__ import annotations

import logging
import re
from dataclasses import dataclass

from google.cloud import bigquery
from google.cloud import bigquery_datatransfer_v1
from google.cloud import dataform_v1
from google.protobuf.json_format import MessageToDict

from .config import Config

logger = logging.getLogger(__name__)

_SAFE_NAME_RE = re.compile(r"[^A-Za-z0-9_.-]+")


def safe_filename(name: str) -> str:
    """Sanitize a BigQuery identifier / display name for use as a filename."""
    cleaned = _SAFE_NAME_RE.sub("_", name).strip("._") or "unnamed"
    return cleaned


def name_to_path_segments(display_name: str) -> list[str]:
    """Split a dotted saved-query name (e.g. 'Sticky_Data.LMC_New_Users') into
    real folder segments, mirroring the dataset.query naming convention used
    in the BigQuery Studio Queries panel."""
    parts = [safe_filename(p) for p in display_name.split(".") if p.strip()]
    return parts or ["unnamed"]


@dataclass
class BackupObject:
    """A single object to persist as one file."""

    relative_path: str  # POSIX-style path relative to the backup root
    content: str


class BigQueryBackupClient:
    def __init__(self, config: Config):
        self.config = config
        self.bq = bigquery.Client(project=config.gcp_project_id)
        self.dts = bigquery_datatransfer_v1.DataTransferServiceClient()
        self.dataform = dataform_v1.DataformClient()

    def list_datasets(self) -> list[str]:
        if self.config.datasets_filter:
            return list(self.config.datasets_filter)
        return [ds.dataset_id for ds in self.bq.list_datasets(self.config.gcp_project_id)]

    def fetch_views(self, dataset_id: str) -> list[BackupObject]:
        query = f"""
            SELECT table_name, table_type, ddl
            FROM `{self.config.gcp_project_id}.{dataset_id}`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
        """
        objects: list[BackupObject] = []
        try:
            rows = self.bq.query(query).result()
        except Exception:
            logger.exception("Failed to list views for dataset %s", dataset_id)
            return objects

        for row in rows:
            if not row.ddl:
                continue
            subfolder = "materialized_views" if row.table_type == "MATERIALIZED_VIEW" else "views"
            filename = f"{safe_filename(row.table_name)}.sql"
            objects.append(
                BackupObject(
                    relative_path=f"{dataset_id}/{subfolder}/{filename}",
                    content=row.ddl.rstrip() + "\n",
                )
            )
        return objects

    def fetch_routines(self, dataset_id: str) -> list[BackupObject]:
        query = f"""
            SELECT routine_name, routine_type, ddl
            FROM `{self.config.gcp_project_id}.{dataset_id}`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
        """
        objects: list[BackupObject] = []
        try:
            rows = self.bq.query(query).result()
        except Exception:
            logger.exception("Failed to list routines for dataset %s", dataset_id)
            return objects

        for row in rows:
            if not row.ddl:
                continue
            subfolder = "procedures" if row.routine_type == "PROCEDURE" else "functions"
            filename = f"{safe_filename(row.routine_name)}.sql"
            objects.append(
                BackupObject(
                    relative_path=f"{dataset_id}/routines/{subfolder}/{filename}",
                    content=row.ddl.rstrip() + "\n",
                )
            )
        return objects

    def fetch_scheduled_queries(self) -> list[BackupObject]:
        objects: list[BackupObject] = []
        for location in self.config.bq_locations:
            parent = (
                f"projects/{self.config.gcp_project_id}/locations/{location}"
            )
            try:
                configs = self.dts.list_transfer_configs(
                    request={"parent": parent, "data_source_ids": ["scheduled_query"]}
                )
            except Exception:
                logger.exception(
                    "Failed to list scheduled queries in location %s", location
                )
                continue

            for cfg in configs:
                as_dict = MessageToDict(cfg._pb, preserving_proto_field_name=True)
                display_name = cfg.display_name or cfg.name.rsplit("/", 1)[-1]
                config_id = cfg.name.rsplit("/", 1)[-1]
                filename = f"{safe_filename(display_name)}__{config_id}.json"
                objects.append(
                    BackupObject(
                        relative_path=f"scheduled_queries/{location}/{filename}",
                        content=_to_pretty_json(as_dict),
                    )
                )
        return objects

    def fetch_saved_queries(self) -> list[BackupObject]:
        objects: list[BackupObject] = []
        for location in self.config.saved_queries_locations:
            parent = f"projects/{self.config.gcp_project_id}/locations/{location}"
            try:
                repos = list(self.dataform.list_repositories(parent=parent))
            except Exception:
                logger.exception(
                    "Failed to list saved queries in location %s", location
                )
                continue

            for repo in repos:
                if repo.labels.get("single-file-asset-type") != "sql":
                    continue  # a real Dataform repo, not a BigQuery Studio saved query

                try:
                    entries = list(
                        self.dataform.query_repository_directory_contents(
                            request={"name": repo.name}
                        )
                    )
                except Exception:
                    logger.exception(
                        "Failed to list files for saved query %s", repo.display_name
                    )
                    continue

                file_paths = [entry.file for entry in entries if entry.file]
                path_segments = name_to_path_segments(repo.display_name)

                for file_path in file_paths:
                    try:
                        file_resp = self.dataform.read_repository_file(
                            request={"name": repo.name, "path": file_path}
                        )
                    except Exception:
                        logger.exception(
                            "Failed to read saved query %s (%s)",
                            repo.display_name,
                            file_path,
                        )
                        continue

                    suffix = "" if len(file_paths) == 1 else f"__{safe_filename(file_path)}"
                    folder = "/".join(path_segments[:-1])
                    filename = f"{path_segments[-1]}{suffix}.sql"
                    relative = f"saved_queries/{location}/{filename}"
                    if folder:
                        relative = f"saved_queries/{location}/{folder}/{filename}"
                    content = file_resp.contents.decode("utf-8", errors="replace")
                    objects.append(
                        BackupObject(relative_path=relative, content=content.rstrip() + "\n")
                    )
        return objects


def _to_pretty_json(data: dict) -> str:
    import json

    return json.dumps(data, indent=2, sort_keys=True, ensure_ascii=False) + "\n"
