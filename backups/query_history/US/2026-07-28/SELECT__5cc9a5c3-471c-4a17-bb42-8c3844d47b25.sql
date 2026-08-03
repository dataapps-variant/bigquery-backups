-- job_id: 5cc9a5c3-471c-4a17-bb42-8c3844d47b25
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:24.176000+00:00
-- started: 2026-07-28T13:42:24.275000+00:00
-- ended: 2026-07-28T13:42:26.256000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-56' AND bc_number = 0
                GROUP BY cohort_date
