-- job_id: 35bddc7e-5c75-4542-80c2-4991117affd1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: None
-- created: 2026-08-03T09:11:13.934000+00:00
-- started: 2026-08-03T09:11:14.125000+00:00
-- ended: 2026-08-03T09:11:14.125000+00:00


                SELECT job_id, user_email, creation_time, start_time, end_time,
                       statement_type, state, query
                FROM `region-us`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
                WHERE creation_time >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY)
                  AND job_type = 'QUERY'
                  AND state = 'DONE'
                  AND query IS NOT NULL
                ORDER BY creation_time DESC
