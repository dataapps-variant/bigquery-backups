-- job_id: 2593d301-dd79-45a1-a034-275c96abda3f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:24.770000+00:00
-- started: 2026-07-28T13:37:24.896000+00:00
-- ended: 2026-07-28T13:37:26.217000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-8' AND bc_number = 0
                GROUP BY cohort_date
