-- job_id: 9d111c04-ecec-41b7-a20d-572e7b8c9c3f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:41.017000+00:00
-- started: 2026-07-28T13:39:41.083000+00:00
-- ended: 2026-07-28T13:39:42.687000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-30' AND bc_number = 0
                GROUP BY cohort_date
