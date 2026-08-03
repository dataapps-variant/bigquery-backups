-- job_id: 41e4c7a5-1a29-47e4-a1a9-d57a06a57024
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:58.470000+00:00
-- started: 2026-07-28T13:41:58.553000+00:00
-- ended: 2026-07-28T13:41:59.926000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-52' AND bc_number = 0
                GROUP BY cohort_date
