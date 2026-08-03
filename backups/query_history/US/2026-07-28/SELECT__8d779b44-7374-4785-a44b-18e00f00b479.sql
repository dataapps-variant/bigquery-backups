-- job_id: 8d779b44-7374-4785-a44b-18e00f00b479
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:01.835000+00:00
-- started: 2026-07-28T13:41:01.893000+00:00
-- ended: 2026-07-28T13:41:03.364000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-43' AND bc_number = 0
                GROUP BY cohort_date
