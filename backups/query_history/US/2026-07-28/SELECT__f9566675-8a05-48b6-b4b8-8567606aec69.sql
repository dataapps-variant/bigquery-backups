-- job_id: f9566675-8a05-48b6-b4b8-8567606aec69
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:09.434000+00:00
-- started: 2026-07-28T13:37:09.529000+00:00
-- ended: 2026-07-28T13:37:11.485000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-6' AND bc_number = 0
                GROUP BY cohort_date
