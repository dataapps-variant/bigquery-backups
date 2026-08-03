-- job_id: 0f1ab999-c877-4bc4-8aae-6ad0b4fcb3bd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:13.846000+00:00
-- started: 2026-07-28T13:38:13.937000+00:00
-- ended: 2026-07-28T13:38:15.232000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-16' AND bc_number = 0
                GROUP BY cohort_date
