# BigQuery Backup Automation

Backs up a BigQuery project's **routines** (stored procedures & functions)
and **scheduled queries** to version-controlled SQL/JSON files, deletes
local backup files for objects that no longer exist in BigQuery, and
commits + pushes the result to GitHub.

Everything this tool does against BigQuery is **read-only** — it never
creates, edits, or deletes anything in your BigQuery project. It only reads
data and writes local backup files / GitHub commits.

## How it works

1. **Discover** — lists every dataset in the project (or a filtered subset),
   and queries `INFORMATION_SCHEMA.ROUTINES` for the exact
   `CREATE OR REPLACE ...` DDL of each routine. Scheduled queries are read
   via the BigQuery Data Transfer API.
2. **Write** — each object becomes one file under `backups/`:
   ```
   backups/
     <dataset>/
       routines/
         procedures/<name>.sql
         functions/<name>.sql
     scheduled_queries/
       <location>/<display_name>__<config_id>.json
   ```
3. **Sync deletions** — any file under `backups/` that no longer corresponds
   to a live BigQuery object (deleted routine or removed scheduled query)
   is deleted, and now-empty folders are pruned.
4. **Commit & push** — stages all changes, commits with a timestamped
   message, and pushes to the configured GitHub remote/branch. If nothing
   new was created, it still pushes any earlier commit that hadn't made it
   to GitHub yet (e.g. after a temporary auth failure).

> **Not covered**: BigQuery views, and manually-saved queries from the
> BigQuery Studio "Saved queries" panel. Views were intentionally excluded
> from this project's scope. Saved queries go through a newer, sparsely
> documented Google API (Dataform) that wasn't reliable enough to build on
> yet — for now, export those manually from the BigQuery UI if needed.

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

The service account (or user) needs, at minimum:
- `roles/bigquery.dataViewer` on the project, to read `INFORMATION_SCHEMA`
- `roles/bigquery.jobUser` on the project, to run the read-only queries that
  pull routine DDL (this only allows running/listing jobs — it cannot alter
  or delete anything)
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
  (transfer configs are region-scoped); defaults to `US`.
