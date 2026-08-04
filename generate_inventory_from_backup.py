#!/usr/bin/env python
"""Generate the same Excel inventory (Type / Dataset / Name) as
generate_inventory.py, but sourced entirely from the local `backups/`
folder instead of querying BigQuery — i.e. exactly what's actually
committed to GitHub, not what's currently live in BigQuery. Useful as an
independent cross-check that the two are in sync, and doesn't need any
BigQuery/Google Cloud credentials to run since it never calls any API.
"""
from __future__ import annotations

import re
from pathlib import Path

from openpyxl import Workbook
from openpyxl.styles import Font

PROJECT_ROOT = Path(__file__).resolve().parent
BACKUP_ROOT = PROJECT_ROOT / "backups"

# Matches the disambiguation suffix our backup script appends when two
# different objects would otherwise land on the same filename, e.g.
# "Refund_Table__view.sql" or "Refund_Table__view_2.sql".
_KIND_SUFFIX_RE = re.compile(
    r"__(view|materialized_view|procedure|function|saved_query|scheduled_query)(?:_\d+)?$"
)
# Scheduled query filenames always end in "__<config-id>", a UUID-like
# string, regardless of collisions.
_CONFIG_ID_RE = re.compile(r"__[0-9a-fA-F-]{16,}$")

_KIND_TO_TYPE = {
    "view": "View",
    "materialized_view": "Materialized View",
    "procedure": "Procedure",
    "function": "Function",
    "saved_query": "Query",
    "scheduled_query": "Scheduled Query",
}

_CONTENT_PATTERNS = [
    (re.compile(r"^\s*CREATE\s+(OR\s+REPLACE\s+)?MATERIALIZED\s+VIEW", re.I), "Materialized View"),
    (re.compile(r"^\s*CREATE\s+(OR\s+REPLACE\s+)?VIEW", re.I), "View"),
    (re.compile(r"^\s*CREATE\s+(OR\s+REPLACE\s+)?PROCEDURE", re.I), "Procedure"),
    (re.compile(r"^\s*CREATE\s+(OR\s+REPLACE\s+)?(TABLE\s+)?FUNCTION", re.I), "Function"),
]


def _classify(stem: str, content: str) -> tuple[str, str]:
    """Returns (type_label, clean_name)."""
    match = _KIND_SUFFIX_RE.search(stem)
    if match:
        clean_name = stem[: match.start()]
        return _KIND_TO_TYPE[match.group(1)], clean_name

    # No explicit kind tag on the filename means this object never
    # collided with anything else, which happens for the vast majority of
    # files. Guess from content; default to "Query" (saved query) since
    # that's the most common un-suffixed case. This can occasionally
    # misclassify a saved query whose own text happens to start with a
    # CREATE VIEW/PROCEDURE/FUNCTION statement as that type instead of
    # "Query" — a known limitation of working from file content alone
    # (generate_inventory.py, which asks BigQuery directly, doesn't have
    # this ambiguity).
    for pattern, label in _CONTENT_PATTERNS:
        if pattern.match(content):
            return label, stem
    return "Query", stem


def collect_rows() -> list[tuple[str, str, str]]:
    rows: list[tuple[str, str, str]] = []

    for path in BACKUP_ROOT.rglob("*"):
        if not path.is_file():
            continue

        relative = path.relative_to(BACKUP_ROOT)
        dataset = "/".join(relative.parts[:-1])

        if path.suffix == ".json":
            stem = _CONFIG_ID_RE.sub("", path.stem)
            rows.append(("Scheduled Query", dataset, stem))
            continue

        if path.suffix != ".sql":
            continue

        content = path.read_text(encoding="utf-8")
        type_label, clean_name = _classify(path.stem, content)
        rows.append((type_label, dataset, clean_name))

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


def main() -> int:
    if not BACKUP_ROOT.is_dir():
        print("No backups/ folder found — run main.py at least once first.")
        return 1

    rows = collect_rows()
    output_path = PROJECT_ROOT / "bigquery_inventory_from_github.xlsx"
    write_excel(rows, output_path)
    print(f"Wrote {len(rows)} rows to {output_path.name} in the project folder.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
