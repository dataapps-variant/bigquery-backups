-- job_id: ab266dc8-c8c1-4f14-b2e3-6851ced76fd7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:30.709000+00:00
-- started: 2026-07-28T13:37:30.803000+00:00
-- ended: 2026-07-28T13:37:32.253000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-9' AND bc_number = 0
                GROUP BY cohort_date
