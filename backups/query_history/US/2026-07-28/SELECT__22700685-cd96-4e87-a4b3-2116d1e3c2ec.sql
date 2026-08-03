-- job_id: 22700685-cd96-4e87-a4b3-2116d1e3c2ec
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:36.982000+00:00
-- started: 2026-07-28T13:42:37.042000+00:00
-- ended: 2026-07-28T13:42:38.479000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-58' AND bc_number = 0
                GROUP BY cohort_date
