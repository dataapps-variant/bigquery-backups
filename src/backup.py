"""Orchestrates fetching every backed-up object type from BigQuery."""
from __future__ import annotations

import logging

from .bq_client import BackupObject, BigQueryBackupClient
from .config import Config

logger = logging.getLogger(__name__)


def collect_all_objects(client: BigQueryBackupClient, config: Config) -> list[BackupObject]:
    objects: list[BackupObject] = []

    datasets = client.list_datasets()
    logger.info("Found %d dataset(s) to back up", len(datasets))

    for dataset_id in datasets:
        views = client.fetch_views(dataset_id)
        routines = client.fetch_routines(dataset_id)
        logger.info(
            "Dataset %s: %d view(s), %d routine(s)",
            dataset_id,
            len(views),
            len(routines),
        )
        objects.extend(views)
        objects.extend(routines)

    scheduled_queries = client.fetch_scheduled_queries()
    logger.info("Found %d scheduled quer(y/ies)", len(scheduled_queries))
    objects.extend(scheduled_queries)

    if config.saved_queries_enabled:
        saved_queries = client.fetch_saved_queries()
        logger.info("Found %d saved quer(y/ies)", len(saved_queries))
        objects.extend(saved_queries)

    return _dedupe_paths(objects)


def _dedupe_paths(objects: list[BackupObject]) -> list[BackupObject]:
    """Different object types can land on the same path once everything is
    grouped by entity name instead of by type (e.g. a routine and a saved
    query both named "Refund_Table" in the same dataset). Resolve collisions
    deterministically by tagging with `kind` rather than fetch order, so the
    same object always lands on the same filename across runs."""
    sorted_objects = sorted(objects, key=lambda o: (o.relative_path, o.kind, o.content))

    used: set[str] = set()
    result: list[BackupObject] = []
    for obj in sorted_objects:
        path = obj.relative_path
        if path in used:
            stem, dot, ext = path.rpartition(".")
            base = f"{stem}__{obj.kind}" if dot else f"{path}__{obj.kind}"
            candidate = f"{base}.{ext}" if dot else base
            suffix_index = 2
            while candidate in used:
                candidate = f"{base}_{suffix_index}.{ext}" if dot else f"{base}_{suffix_index}"
                suffix_index += 1
            path = candidate
            logger.warning(
                "Path collision resolved: %s -> %s (kind=%s)", obj.relative_path, path, obj.kind
            )

        used.add(path)
        result.append(BackupObject(relative_path=path, content=obj.content, kind=obj.kind))
    return result
