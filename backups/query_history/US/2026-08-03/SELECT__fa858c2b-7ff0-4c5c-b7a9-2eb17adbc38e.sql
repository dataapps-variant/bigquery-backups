-- job_id: fa858c2b-7ff0-4c5c-b7a9-2eb17adbc38e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:00:56.307000+00:00
-- started: 2026-08-03T13:00:56.550000+00:00
-- ended: 2026-08-03T13:00:57.736000+00:00


SELECT job_id, statement_type FROM `region-us`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
WHERE creation_time >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY) AND job_type='QUERY' LIMIT 5
