# BigQuery Backup Automation

Backs up a BigQuery project's **routines** (stored procedures & functions),
**scheduled queries**, and recent **query history** (every query actually
run) to version-controlled SQL/JSON files, deletes local backup files for
objects that no longer exist in BigQuery, and commits + pushes the result to
GitHub.

Everything this tool does against BigQuery is **read-only** — it never
creates, edits, or deletes anything in your BigQuery project. It only reads
data and writes local backup files / GitHub commits.

## How it works

1. **Discover** — lists every dataset in the project (or a filtered subset),
   and queries `INFORMATION_SCHEMA.ROUTINES` for the exact
   `CREATE OR REPLACE ...` DDL of each routine. Scheduled queries are read via
   the BigQuery Data Transfer API. Query history is read from
   `INFORMATION_SCHEMA.JOBS_BY_PROJECT` for a configurable lookback window.
2. **Write** — each object becomes one file under `backups/`:
   ```
   backups/
     <dataset>/
       routines/
         procedures/<name>.sql
         functions/<name>.sql
     scheduled_queries/
       <location>/<display_name>__<config_id>.json
     query_history/
       <location>/<date>/<job_id>.sql
   ```
3. **Sync deletions** — any file under `backups/` that no longer corresponds
   to a live BigQuery object (deleted routine, removed scheduled query, or
   query history that has aged out) is deleted, and now-empty folders are
   pruned.
4. **Commit & push** — stages all changes, commits with a timestamped
   message, and pushes to the configured GitHub remote/branch. If nothing
   changed, no commit is made.

> **Not covered**: manually-saved queries from the BigQuery Studio UI
> ("Saved queries" panel). Google does not currently provide an API for
> reading these, so they can't be backed up automatically.

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
| `GITHUB_TOKEN` | PAT for HTTPS push auth (omit if using SSH remote / a credential helper) |

The service account (or user) needs, at minimum:
- `roles/bigquery.dataViewer` on the project, to read `INFORMATION_SCHEMA`
- `roles/bigquery.jobUser` on the project, to run the read-only queries that
  pull DDL and query history (this only allows running/listing jobs — it
  cannot alter or delete anything)
- `roles/bigquery.admin` or the narrower `bigquery.transfers.get` / `list`
  permission, to read scheduled queries

### Run it

```bash
python main.py
```

## Automating it

A ready-to-use GitHub Actions workflow is included at
[.github/workflows/backup.yml](.github/workflows/backup.yml). It runs daily
(cron) and can also be triggered manually. Configure these in the repo
settings:

- **Secrets**: `GCP_SERVICE_ACCOUNT_KEY` (JSON key contents), `GCP_PROJECT_ID`
- **Variables** (optional): `BQ_DATASETS`, `BQ_LOCATIONS`

`GITHUB_TOKEN` is provided automatically by Actions — no extra secret needed
for the push step.

## Notes

- Set `GIT_PUSH_ENABLED=false` to run purely as a local backup (no commit/push).
- `BQ_DATASETS` restricts backups to specific datasets (comma-separated);
  leave empty to back up every dataset in the project.
- `BQ_LOCATIONS` controls which regions are checked for scheduled queries
  and query history (both are region-scoped); defaults to `US`.
- `QUERY_HISTORY_DAYS` controls how many days of query history to keep
  (default 7). `QUERY_HISTORY_ENABLED=false` turns this off entirely.
