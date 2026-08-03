-- job_id: 47e4f103-5ee4-4db1-8bea-1b02433da03f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:18.502000+00:00
-- started: 2026-07-28T13:37:18.591000+00:00
-- ended: 2026-07-28T13:37:19.909000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-7' AND bc_number = 0
                GROUP BY cohort_date
