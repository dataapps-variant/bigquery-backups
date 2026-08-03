-- job_id: 32de6d62-0f7e-471d-9bfb-e337d1e3d484
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:55.634000+00:00
-- started: 2026-07-28T13:40:55.681000+00:00
-- ended: 2026-07-28T13:40:57.208000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-42' AND bc_number = 0
                GROUP BY cohort_date
