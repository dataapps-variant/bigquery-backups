"""Manages dated snapshot folders under the backup root (e.g.
backups/2026-08-04/), so each run creates a full point-in-time copy rather
than continuously overwriting a single folder — comparing two snapshot
folders shows exactly what was added, removed, or changed between runs.
Only the most recent `keep` snapshots are retained; older ones (and any
stray non-dated content left over from before this was introduced) are
removed automatically."""
from __future__ import annotations

import logging
import re
import shutil
from pathlib import Path

logger = logging.getLogger(__name__)

_DATE_FOLDER_RE = re.compile(r"^\d{4}-\d{2}-\d{2}$")


def prune_old_snapshots(backup_root: Path, keep: int) -> list[str]:
    """Keep only the `keep` most recent dated snapshot folders directly
    under backup_root; remove everything else found there (older
    snapshots, and any leftover non-dated files/folders)."""
    if not backup_root.is_dir():
        return []

    entries = list(backup_root.iterdir())
    dated_dirs = sorted(
        (p for p in entries if p.is_dir() and _DATE_FOLDER_RE.match(p.name)),
        key=lambda p: p.name,
        reverse=True,
    )
    keep_names = {p.name for p in dated_dirs[:keep]}

    removed: list[str] = []
    for path in entries:
        if path.is_dir() and path.name in keep_names:
            continue
        try:
            if path.is_dir():
                shutil.rmtree(path)
            else:
                path.unlink()
            removed.append(path.name)
            logger.info("Pruned old snapshot content: %s", path.name)
        except OSError:
            # Same cloud-sync-lock situation as directory pruning during a
            # normal sync — leaving it behind this run is harmless, it'll
            # be retried (and likely succeed) on the next run.
            logger.warning("Could not remove %s (left in place, will retry next run)", path.name)

    return removed
