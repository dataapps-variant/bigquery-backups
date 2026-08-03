-- job_id: 9885dee0-bb4e-416a-bb3f-8e761ca12e56
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:53.454000+00:00
-- started: 2026-07-28T13:39:53.567000+00:00
-- ended: 2026-07-28T13:39:54.909000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-32' AND bc_number = 0
                GROUP BY cohort_date
