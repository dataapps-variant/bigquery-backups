-- job_id: 2c0ecac3-0f8b-4909-a86a-1abdb4cdd292
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:03.121000+00:00
-- started: 2026-07-28T13:37:03.228000+00:00
-- ended: 2026-07-28T13:37:04.535000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-5' AND bc_number = 0
                GROUP BY cohort_date
