-- job_id: 52006966-25a9-4603-b4bf-925a748dbc2a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:38.045000+00:00
-- started: 2026-07-28T13:40:38.128000+00:00
-- ended: 2026-07-28T13:40:39.799000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-39' AND bc_number = 0
                GROUP BY cohort_date
