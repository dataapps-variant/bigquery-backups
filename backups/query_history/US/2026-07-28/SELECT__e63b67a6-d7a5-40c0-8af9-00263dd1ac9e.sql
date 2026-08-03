-- job_id: e63b67a6-d7a5-40c0-8af9-00263dd1ac9e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:36.955000+00:00
-- started: 2026-07-28T13:37:37.040000+00:00
-- ended: 2026-07-28T13:37:38.291000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-10' AND bc_number = 1
                GROUP BY cohort_date
