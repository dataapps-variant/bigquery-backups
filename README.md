# BigQuery Backup Automation

Backs up a BigQuery project's **views**, **materialized views**, **routines**
(stored procedures & functions), **scheduled queries**, and BigQuery Studio
**saved queries** to version-controlled SQL/JSON files, deletes local
backup files for objects that no longer exist in BigQuery, and commits +
pushes the result to GitHub.

Everything this tool does against BigQuery is **read-only** — it never
creates, edits, or deletes anything in your BigQuery project. It only reads
data and writes local backup files / GitHub commits.

> **Not covered**: saved queries marked **"Private"** in BigQuery Studio.
> Google restricts these to only be readable by the individual person who
> created them — not even an admin or a service account can read them via
> API, by design. If one is missing from the backup, its owner needs to
> change its visibility to "Project" in the BigQuery UI; it'll then be
> picked up automatically on the next run.

## How it works

1. **Discover** — lists every dataset in the project (or a filtered subset),
   and queries `INFORMATION_SCHEMA.TABLES` / `INFORMATION_SCHEMA.ROUTINES`
   for the exact `CREATE OR REPLACE ...` DDL of each view and routine.
   Scheduled queries are read via the BigQuery Data Transfer API. Saved
   queries are read via the Dataform API — BigQuery Studio stores each saved
   query as its own single-file Dataform "repository" behind the scenes,
   which is why a separate Google service is involved here.
2. **Write** — each run creates a new **dated snapshot folder**,
   `backups/YYYY-MM-DD/`, rather than overwriting one folder in place. Only
   the most recent `SNAPSHOT_RETENTION_COUNT` snapshots (default 3) are
   kept — older ones are deleted automatically, so the repo doesn't grow
   forever. Comparing two snapshot folders shows exactly what was added,
   removed, or changed between runs.

   Within a snapshot, every object lands in one folder per **entity**
   (dataset name, or the dataset-like prefix in a saved/scheduled query's
   name), mirroring how the BigQuery Studio "Queries" panel groups results
   when you search by that prefix. There's no separate
   views/routines/saved_queries split:
   ```
   backups/
     2026-08-04/
       Sticky_Data/
         LMC_New_Users.sql        (a saved query named "Sticky_Data.LMC_New_Users")
         Some_View.sql            (a view that actually lives in the Sticky_Data dataset)
         Some_Procedure.sql       (a routine that actually lives in the Sticky_Data dataset)
       Ad_spend_data/
         Merged_Spend_View.sql
         ...
       A_Query_With_No_Dot_In_Its_Name.sql   (saved queries with no dataset-like
                                               prefix land at the top level)
     2026-07-20/
       ...
     2026-07-05/
       ...
   ```
   If two different objects would land on the exact same filename within a
   snapshot (e.g. a routine and a saved query both named `Refund_Table` in
   the same folder), the newer one is suffixed with its type
   (`Refund_Table__view.sql`) so nothing gets silently overwritten —
   resolved the same way on every run, not based on fetch order.
3. **Sync deletions within the snapshot** — any file under that run's
   snapshot folder that no longer corresponds to a live BigQuery object is
   removed before the snapshot is finalized, and now-empty folders are
   pruned. Separately, entire old *snapshots* beyond the retention count are
   deleted (see above) — that's how a query's removal from BigQuery shows up
   over time, by simply being absent from newer snapshots while still
   visible in older ones (until those age out too).
4. **Commit & push** — stages all changes, commits with a timestamped
   message, and pushes to the configured GitHub remote/branch. If nothing
   new was created, it still pushes any earlier commit that hadn't made it
   to GitHub yet (e.g. after a temporary auth failure).

## Setup

```bash
python -m venv .venv
.venv\Scripts\activate        # Windows
pip install -r requirements.txt
copy .env.example .env        # then fill in the values
```

### Required environment variables (see `.env.example` for the full list)

| Variable | Purpose |
|---|---|
| `GCP_PROJECT_ID` | Project to back up |
| `GOOGLE_APPLICATION_CREDENTIALS` | Path to a service account key (omit to use Application Default Credentials) |
| `GIT_REMOTE_URL` | e.g. `https://github.com/<user>/<repo>.git` |
| `GITHUB_TOKEN` | PAT for HTTPS push auth — needs the `repo` scope, and `workflow` too if `.github/workflows/backup.yml` is included in the repo |
| `SAVED_QUERIES_LOCATIONS` | Region(s) to check for saved queries — see note below, this is often *not* the same region as your datasets |

The service account (or user) needs, at minimum:
- `roles/bigquery.dataViewer` on the project, to read `INFORMATION_SCHEMA`
- `roles/bigquery.jobUser` on the project, to run the read-only queries that
  pull view/routine DDL (this only allows running/listing jobs — it cannot
  alter or delete anything)
- `roles/bigquery.admin` or the narrower `bigquery.transfers.get` / `list`
  permission, to read scheduled queries
- `roles/dataform.viewer` on the project, to read saved queries

### About `SAVED_QUERIES_LOCATIONS`

Saved queries live in a Dataform-backed region that's independent of where
your BigQuery datasets are — and different saved queries in the same
project can live in *different* regions. If the count in your backup is
lower than what you see in BigQuery, add a "Location" column to the
BigQuery Studio "Queries" panel (via the column picker icon above the
results table) to see exactly which regions are actually in use, then list
all of them in `SAVED_QUERIES_LOCATIONS`, comma-separated (e.g.
`us-central1,asia-south1`).

### Run it

```bash
python main.py
```

## Automating it

A ready-to-use GitHub Actions workflow is included at
[.github/workflows/backup.yml](.github/workflows/backup.yml). It runs on the
1st and 16th of each month — the closest a calendar-based cron schedule can
get to "every 15 days" — and can also be triggered manually anytime from the
Actions tab. Configure these in the repo settings:

- **Secrets**: `GCP_SERVICE_ACCOUNT_KEY` (JSON key contents), `GCP_PROJECT_ID`
- **Variables** (optional): `BQ_DATASETS`, `BQ_LOCATIONS`, `SAVED_QUERIES_LOCATIONS`, `SNAPSHOT_RETENTION_COUNT`

`GITHUB_TOKEN` is provided automatically by Actions — no extra secret needed
for the push step.

## Notes

- Set `GIT_PUSH_ENABLED=false` to run purely as a local backup (no commit/push).
- `BQ_DATASETS` restricts backups to specific datasets (comma-separated);
  leave empty to back up every dataset in the project.
- `BQ_LOCATIONS` controls which regions are checked for scheduled queries
  (transfer configs are region-scoped); defaults to `US`.
- `SAVED_QUERIES_ENABLED=false` turns off saved-query backup entirely.
- `SNAPSHOT_RETENTION_COUNT` controls how many dated snapshots to keep
  (default 3). Raise it to keep more history, at the cost of a larger repo.
