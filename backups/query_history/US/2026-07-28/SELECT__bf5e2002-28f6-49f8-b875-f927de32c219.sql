-- job_id: bf5e2002-28f6-49f8-b875-f927de32c219
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:42.705000+00:00
-- started: 2026-07-28T13:36:42.814000+00:00
-- ended: 2026-07-28T13:36:44.342000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-2' AND bc_number = 0
                GROUP BY cohort_date
