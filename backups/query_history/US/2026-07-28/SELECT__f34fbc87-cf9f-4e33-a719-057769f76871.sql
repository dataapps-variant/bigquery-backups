-- job_id: f34fbc87-cf9f-4e33-a719-057769f76871
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:55.888000+00:00
-- started: 2026-07-28T13:37:56.019000+00:00
-- ended: 2026-07-28T13:37:57.549000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-13' AND bc_number = 0
                GROUP BY cohort_date
