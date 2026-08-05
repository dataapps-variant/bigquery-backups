#!/usr/bin/env python
"""Entry point: back up BigQuery views, routines, and scheduled queries to
disk, sync deletions, and push the result to GitHub.

All configuration comes from environment variables — see .env.example.
"""
from __future__ import annotations

import logging
import sys
from datetime import datetime, timezone
from pathlib import Path

from src.backup import collect_all_objects
from src.bq_client import BigQueryBackupClient
from src.config import Config, ConfigError
from src.git_utils import GitError, commit, ensure_repo, has_staged_changes, push, stage_all
from src.inventory import build_rows, write_csv, write_excel
from src.snapshots import prune_old_snapshots
from src.sync import sync_backup_dir

PROJECT_ROOT = Path(__file__).resolve().parent


def setup_logging(level: str) -> None:
    logging.basicConfig(
        level=level,
        format="%(asctime)s %(levelname)-8s %(name)s: %(message)s",
        datefmt="%Y-%m-%dT%H:%M:%S",
    )


def main() -> int:
    try:
        config = Config.from_env()
    except ConfigError as exc:
        print(f"Configuration error: {exc}", file=sys.stderr)
        return 1

    setup_logging(config.log_level)
    logger = logging.getLogger("bigquery_backup")

    backup_root = (
        config.backup_root_dir
        if config.backup_root_dir.is_absolute()
        else PROJECT_ROOT / config.backup_root_dir
    )
    snapshot_date = datetime.now(timezone.utc).strftime("%Y-%m-%d")
    snapshot_root = backup_root / snapshot_date

    logger.info(
        "Backing up project %s to %s (snapshot %s)", config.gcp_project_id, backup_root, snapshot_date
    )

    client = BigQueryBackupClient(config)
    objects = collect_all_objects(client, config)

    result = sync_backup_dir(snapshot_root, objects)
    logger.info(
        "Sync complete: %d written/updated, %d unchanged, %d deleted",
        result.written,
        result.unchanged,
        len(result.deleted),
    )
    for deleted_path in result.deleted:
        logger.info("  deleted: %s", deleted_path)

    removed_snapshots = prune_old_snapshots(backup_root, config.snapshot_retention_count)
    if removed_snapshots:
        logger.info(
            "Pruned to the latest %d snapshot(s), removed: %s",
            config.snapshot_retention_count,
            ", ".join(sorted(removed_snapshots)),
        )

    # Local convenience exports, not part of the backup itself — each is
    # independent so one being open in Excel elsewhere never blocks the
    # other, and neither may ever block committing/pushing the real
    # backup data.
    inventory_rows = build_rows(objects)
    for label, writer, filename in (
        ("xlsx", write_excel, "inventory.xlsx"),
        ("csv", write_csv, "inventory.csv"),
    ):
        try:
            writer(inventory_rows, PROJECT_ROOT / filename)
            logger.info("Wrote inventory (%d rows) to %s", len(inventory_rows), filename)
        except OSError:
            logger.warning(
                "Could not write %s (likely open elsewhere) — skipping it this run", filename
            )

    if not config.git_push_enabled:
        logger.info("GIT_PUSH_ENABLED is false — skipping git commit/push")
        return 0

    try:
        ensure_repo(PROJECT_ROOT, config)
        stage_all(PROJECT_ROOT)

        if has_staged_changes(PROJECT_ROOT):
            timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M:%S UTC")
            message = f"{config.commit_message_prefix} ({timestamp})"
            commit(PROJECT_ROOT, message)
            logger.info("Committed: %s", message)
        else:
            logger.info("No changes since last backup — nothing new to commit")

        # Always attempt a push: an earlier run may have committed locally
        # but failed to push (e.g. an auth error), leaving commits stranded.
        push(PROJECT_ROOT, config)
        logger.info("Pushed to remote branch %s", config.git_branch)
    except GitError as exc:
        logger.error("Git operation failed: %s", exc)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
