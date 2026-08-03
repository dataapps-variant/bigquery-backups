-- job_id: 4e4d676e-5edf-4c2d-8d17-ce1772518c28
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: None
-- created: 2026-08-03T09:13:46.654000+00:00
-- started: 2026-08-03T09:13:46.833000+00:00
-- ended: 2026-08-03T09:13:46.833000+00:00


                SELECT job_id, user_email, creation_time, start_time, end_time,
                       statement_type, state, query
                FROM `region-us`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
                WHERE creation_time >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY)
                  AND job_type = 'QUERY'
                  AND state = 'DONE'
                  AND query IS NOT NULL
                ORDER BY creation_time DESC
