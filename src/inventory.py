"""Builds an accurate Type / Dataset / Name inventory straight from the
same BackupObject list the backup itself writes to disk — no guessing from
file content required, since each object's `kind` is already known
precisely at this point (before the collision-disambiguation suffix gets
appended to its filename)."""
from __future__ import annotations

import csv
import re
from pathlib import Path

from openpyxl import Workbook
from openpyxl.styles import Font

from .bq_client import BackupObject

_KIND_TO_TYPE = {
    "view": "View",
    "materialized_view": "Materialized View",
    "procedure": "Procedure",
    "function": "Function",
    "scheduled_query": "Scheduled Query",
    "saved_query": "Query",
}

# Matches the "__<kind>" or "__<kind>_<n>" suffix _dedupe_paths appends on a
# filename collision — safe to strip unconditionally here since we already
# know the true kind from the object itself, not from parsing this suffix.
_COLLISION_SUFFIX_RE = re.compile(r"__[a-z_]+(?:_\d+)?$")
# Scheduled query filenames always end in "__<config-id>", a UUID-like
# string, regardless of collisions.
_CONFIG_ID_RE = re.compile(r"__[0-9a-fA-F-]{16,}$")


def build_rows(objects: list[BackupObject]) -> list[tuple[str, str, str]]:
    rows: list[tuple[str, str, str]] = []
    for obj in objects:
        path = Path(obj.relative_path)
        dataset = "/".join(path.parts[:-1])
        stem = path.stem
        stem = _CONFIG_ID_RE.sub("", stem) if obj.kind == "scheduled_query" else stem
        stem = _COLLISION_SUFFIX_RE.sub("", stem)
        type_label = _KIND_TO_TYPE.get(obj.kind, obj.kind)
        rows.append((type_label, dataset, stem))

    rows.sort(key=lambda r: (r[1], r[0], r[2]))
    return rows


def write_excel(rows: list[tuple[str, str, str]], output_path: Path) -> None:
    wb = Workbook()
    ws = wb.active
    ws.title = "Inventory"
    ws.append(["Type", "Dataset", "Name"])
    for cell in ws[1]:
        cell.font = Font(bold=True)

    for row in rows:
        ws.append(row)

    ws.column_dimensions["A"].width = 18
    ws.column_dimensions["B"].width = 35
    ws.column_dimensions["C"].width = 45
    ws.freeze_panes = "A2"

    wb.save(output_path)


def write_csv(rows: list[tuple[str, str, str]], output_path: Path) -> None:
    with open(output_path, "w", encoding="utf-8", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["Type", "Dataset", "Name"])
        writer.writerows(rows)
