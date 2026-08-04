"""Writes backup objects to disk and deletes any previously-backed-up file
that no longer corresponds to a live BigQuery object (i.e. it was deleted /
renamed in BigQuery since the last run)."""
from __future__ import annotations

import logging
from dataclasses import dataclass
from pathlib import Path

from .bq_client import BackupObject

logger = logging.getLogger(__name__)


@dataclass
class SyncResult:
    written: int = 0
    unchanged: int = 0
    deleted: list[str] | None = None

    def __post_init__(self):
        if self.deleted is None:
            self.deleted = []


def sync_backup_dir(root: Path, objects: list[BackupObject]) -> SyncResult:
    root.mkdir(parents=True, exist_ok=True)
    result = SyncResult()

    expected_relative_paths: set[Path] = set()

    for obj in objects:
        relative_path = Path(*obj.relative_path.split("/"))
        expected_relative_paths.add(relative_path)
        target = root / relative_path
        target.parent.mkdir(parents=True, exist_ok=True)

        # Normalize any CRLF/CR that BigQuery/Dataform returned as part of
        # the content itself, on top of pinning the on-disk line ending to
        # LF via newline="\n" (without it, Path.write_text() on Windows
        # silently rewrites every "\n" to "\r\n"). Either source shows up as
        # stray ^M characters in editors and diffs that expect LF-only text.
        content = obj.content.replace("\r\n", "\n").replace("\r", "\n")

        if target.exists() and _read_lf(target) == content:
            result.unchanged += 1
            continue

        target.write_text(content, encoding="utf-8", newline="\n")
        result.written += 1

    existing_files = [p for p in root.rglob("*") if p.is_file()]
    for path in existing_files:
        relative_path = path.relative_to(root)
        if relative_path not in expected_relative_paths:
            path.unlink()
            result.deleted.append(str(relative_path.as_posix()))
            logger.info("Removed stale backup file (deleted in BigQuery): %s", relative_path)

    _prune_empty_dirs(root)
    return result


def _read_lf(path: Path) -> str:
    # Path.read_text() only gained a `newline` parameter in Python 3.13;
    # open() has always supported it, so use that for LF-only reading.
    with open(path, "r", encoding="utf-8", newline="\n") as f:
        return f.read()


def _prune_empty_dirs(root: Path) -> None:
    # Walk bottom-up so parent directories become eligible after their
    # now-empty children are removed.
    for dirpath in sorted(
        (p for p in root.rglob("*") if p.is_dir()),
        key=lambda p: len(p.parts),
        reverse=True,
    ):
        try:
            next(dirpath.iterdir())
        except StopIteration:
            try:
                dirpath.rmdir()
            except (PermissionError, OSError):
                # A cloud-sync client (OneDrive, Dropbox, etc.) can briefly
                # hold a lock on a directory right after a burst of file
                # deletions. Leaving an empty folder behind is harmless —
                # git doesn't track empty directories anyway — so skip it
                # rather than let the whole backup run fail.
                logger.warning("Could not remove empty directory (left in place): %s", dirpath)
        except FileNotFoundError:
            pass
