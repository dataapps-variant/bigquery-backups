-- job_id: 979acc3e-1814-49c9-a5eb-e24dcde2260b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:46.257000+00:00
-- started: 2026-07-28T13:41:46.387000+00:00
-- ended: 2026-07-28T13:41:47.782000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-50' AND bc_number = 0
                GROUP BY cohort_date
