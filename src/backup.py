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

    return objects
