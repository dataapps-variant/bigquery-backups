"""Wraps the BigQuery and BigQuery Data Transfer APIs to fetch the objects
this project backs up: routines (procedures/functions), scheduled queries,
and recent query history. Every call here is read-only — nothing in
BigQuery is ever created, modified, or deleted."""
from __future__ import annotations

import logging
import re
from dataclasses import dataclass

from google.cloud import bigquery
from google.cloud import bigquery_datatransfer_v1
from google.protobuf.json_format import MessageToDict

from .config import Config

logger = logging.getLogger(__name__)

_SAFE_NAME_RE = re.compile(r"[^A-Za-z0-9_.-]+")


def safe_filename(name: str) -> str:
    """Sanitize a BigQuery identifier / display name for use as a filename."""
    cleaned = _SAFE_NAME_RE.sub("_", name).strip("._") or "unnamed"
    return cleaned


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

    def list_datasets(self) -> list[str]:
        if self.config.datasets_filter:
            return list(self.config.datasets_filter)
        return [ds.dataset_id for ds in self.bq.list_datasets(self.config.gcp_project_id)]

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

    def fetch_query_history(self) -> list[BackupObject]:
        """Every query actually run in the project within the configured
        lookback window (INFORMATION_SCHEMA.JOBS_BY_PROJECT is region-scoped
        and self-expires per BigQuery's retention, so old entries roll off
        both BigQuery and this backup automatically)."""
        objects: list[BackupObject] = []
        for location in self.config.bq_locations:
            region = f"region-{location.lower()}"
            query = f"""
                SELECT job_id, user_email, creation_time, start_time, end_time,
                       statement_type, state, query
                FROM `{region}`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
                WHERE creation_time >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL {self.config.query_history_days} DAY)
                  AND job_type = 'QUERY'
                  AND state = 'DONE'
                  AND query IS NOT NULL
                ORDER BY creation_time DESC
            """
            try:
                rows = self.bq.query(query).result()
            except Exception:
                logger.exception(
                    "Failed to list query history in location %s", location
                )
                continue

            for row in rows:
                if not row.query:
                    continue
                date_str = row.creation_time.strftime("%Y-%m-%d")
                filename = f"{safe_filename(row.job_id)}.sql"
                header = (
                    f"-- job_id: {row.job_id}\n"
                    f"-- user: {row.user_email}\n"
                    f"-- statement_type: {row.statement_type}\n"
                    f"-- created: {row.creation_time.isoformat()}\n"
                    f"-- started: {row.start_time.isoformat() if row.start_time else ''}\n"
                    f"-- ended: {row.end_time.isoformat() if row.end_time else ''}\n\n"
                )
                objects.append(
                    BackupObject(
                        relative_path=f"query_history/{location}/{date_str}/{filename}",
                        content=header + row.query.rstrip() + "\n",
                    )
                )
        return objects


def _to_pretty_json(data: dict) -> str:
    import json

    return json.dumps(data, indent=2, sort_keys=True, ensure_ascii=False) + "\n"
