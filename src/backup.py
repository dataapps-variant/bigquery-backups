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
        routines = client.fetch_routines(dataset_id)
        logger.info("Dataset %s: %d routine(s)", dataset_id, len(routines))
        objects.extend(routines)

    scheduled_queries = client.fetch_scheduled_queries()
    logger.info("Found %d scheduled quer(y/ies)", len(scheduled_queries))
    objects.extend(scheduled_queries)

    if config.query_history_enabled:
        query_history = client.fetch_query_history()
        logger.info(
            "Found %d executed quer(y/ies) in the last %d day(s)",
            len(query_history),
            config.query_history_days,
        )
        objects.extend(query_history)

    return objects
