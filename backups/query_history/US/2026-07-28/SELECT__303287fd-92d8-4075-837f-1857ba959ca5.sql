-- job_id: 303287fd-92d8-4075-837f-1857ba959ca5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:17.236000+00:00
-- started: 2026-07-28T13:39:17.307000+00:00
-- ended: 2026-07-28T13:39:18.860000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-26' AND bc_number = 1
                GROUP BY cohort_date
