-- job_id: ed24e863-fd70-4ea9-b4f1-eecf4243e19a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:40.346000+00:00
-- started: 2026-07-28T13:41:40.417000+00:00
-- ended: 2026-07-28T13:41:41.926000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-49' AND bc_number = 0
                GROUP BY cohort_date
