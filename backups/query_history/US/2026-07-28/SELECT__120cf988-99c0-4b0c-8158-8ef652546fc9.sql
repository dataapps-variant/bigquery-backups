-- job_id: 120cf988-99c0-4b0c-8158-8ef652546fc9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:12.262000+00:00
-- started: 2026-07-28T13:40:12.346000+00:00
-- ended: 2026-07-28T13:40:14.208000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-35' AND bc_number = 0
                GROUP BY cohort_date
