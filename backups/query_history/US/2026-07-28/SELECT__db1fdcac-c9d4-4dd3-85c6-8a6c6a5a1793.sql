-- job_id: db1fdcac-c9d4-4dd3-85c6-8a6c6a5a1793
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:42.732000+00:00
-- started: 2026-07-28T13:42:42.817000+00:00
-- ended: 2026-07-28T13:42:44.243000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-59' AND bc_number = 0
                GROUP BY cohort_date
