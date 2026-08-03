-- job_id: 65fd8ec8-3883-417c-95bb-2c19455ed288
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: None
-- created: 2026-08-03T11:49:48.634000+00:00
-- started: 2026-08-03T11:49:48.856000+00:00
-- ended: 2026-08-03T11:49:48.856000+00:00


SELECT job_id, statement_type FROM `region-us`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
WHERE creation_time >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY) AND job_type='QUERY' LIMIT 5
