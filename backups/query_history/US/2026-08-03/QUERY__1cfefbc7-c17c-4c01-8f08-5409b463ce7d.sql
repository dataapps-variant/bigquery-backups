-- job_id: 1cfefbc7-c17c-4c01-8f08-5409b463ce7d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: None
-- created: 2026-08-03T12:35:18.574000+00:00
-- started: 2026-08-03T12:35:18.836000+00:00
-- ended: 2026-08-03T12:35:18.836000+00:00


                SELECT job_id, user_email, creation_time, start_time, end_time,
                       statement_type, state, query
                FROM `region-us`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
                WHERE creation_time >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY)
                  AND job_type = 'QUERY'
                  AND state = 'DONE'
                  AND query IS NOT NULL
                ORDER BY creation_time DESC
