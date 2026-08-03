-- job_id: d5302c52-3789-44b1-94be-a12e8ecdd59e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:22.414000+00:00
-- started: 2026-07-28T13:41:22.479000+00:00
-- ended: 2026-07-28T13:41:24.277000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-46' AND bc_number = 0
                GROUP BY cohort_date
