#!/usr/bin/env python
"""Generate a single Excel file listing every view, routine, scheduled
query, and saved query in the BigQuery project — Type / Dataset / Name —
for quick documentation or cross-checking against the BigQuery UI without
having to browse the GitHub repo folder by folder.

Read-only, same as the main backup script: this only queries BigQuery,
Data Transfer, and Dataform — nothing is created, modified, or deleted.
"""
from __future__ import annotations

from pathlib import Path

from src.bq_client import (
    SAVED_QUERY_ENTITY_OVERRIDES,
    BigQueryBackupClient,
    name_to_path_segments,
)
from src.config import Config
from src.inventory import write_csv, write_excel

PROJECT_ROOT = Path(__file__).resolve().parent


def _entity_and_name(display_name: str) -> tuple[str, str]:
    """Plain entity/name split — mirrors fetch_scheduled_queries, which
    does NOT apply the saved-query overrides below."""
    segments = name_to_path_segments(display_name)
    dataset = "/".join(segments[:-1])
    return dataset, segments[-1]


def _saved_query_entity_and_name(display_name: str) -> tuple[str, str]:
    """Same as _entity_and_name, but applies SAVED_QUERY_ENTITY_OVERRIDES —
    mirrors fetch_saved_queries exactly. Overrides are specific to saved
    queries only; a scheduled query with the same literal name is a
    different object and must not be affected."""
    override = SAVED_QUERY_ENTITY_OVERRIDES.get(display_name)
    if override:
        segments = name_to_path_segments(display_name)
        return override, segments[-1]
    return _entity_and_name(display_name)


def collect_rows(client: BigQueryBackupClient, config: Config) -> list[tuple[str, str, str]]:
    rows: list[tuple[str, str, str]] = []

    datasets = client.list_datasets()
    for dataset_id in datasets:
        for obj in client.fetch_views(dataset_id):
            name = Path(obj.relative_path).stem
            type_label = "Materialized View" if obj.kind == "materialized_view" else "View"
            rows.append((type_label, dataset_id, name))

        for obj in client.fetch_routines(dataset_id):
            name = Path(obj.relative_path).stem
            type_label = "Procedure" if obj.kind == "procedure" else "Function"
            rows.append((type_label, dataset_id, name))

    for location in config.bq_locations:
        parent = f"projects/{config.gcp_project_id}/locations/{location}"
        try:
            configs = list(client.dts.list_transfer_configs(request={"parent": parent}, timeout=120))
        except Exception:
            continue
        for cfg in configs:
            if cfg.data_source_id != "scheduled_query":
                continue
            display_name = cfg.display_name or cfg.name.rsplit("/", 1)[-1]
            dataset, name = _entity_and_name(display_name)
            rows.append(("Scheduled Query", dataset, name))

    if config.saved_queries_enabled:
        for location in config.saved_queries_locations:
            parent = f"projects/{config.gcp_project_id}/locations/{location}"
            try:
                repos = list(client.dataform.list_repositories(parent=parent))
            except Exception:
                continue
            for repo in repos:
                if repo.labels.get("single-file-asset-type") != "sql":
                    continue
                dataset, name = _saved_query_entity_and_name(repo.display_name)
                rows.append(("Query", dataset, name))

    rows.sort(key=lambda r: (r[1], r[0], r[2]))
    return rows


def main() -> int:
    config = Config.from_env()
    client = BigQueryBackupClient(config)

    rows = collect_rows(client, config)

    write_excel(rows, PROJECT_ROOT / "bigquery_inventory.xlsx")
    write_csv(rows, PROJECT_ROOT / "bigquery_inventory.csv")
    # Print just filenames, not full paths — this project's folder name
    # contains non-ASCII characters that some Windows terminals can't
    # print, which would otherwise crash this success message.
    print(f"Wrote {len(rows)} rows to bigquery_inventory.xlsx / bigquery_inventory.csv")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
