-- job_id: 4377f9e8-af39-4898-87dd-f9fcc9d8bee9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:52.712000+00:00
-- started: 2026-07-28T13:41:52.783000+00:00
-- ended: 2026-07-28T13:41:54.028000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-51' AND bc_number = 0
                GROUP BY cohort_date
