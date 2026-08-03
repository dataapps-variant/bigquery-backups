-- job_id: a303ba70-50d4-4ece-bd02-04c117e14f70
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:38.056000+00:00
-- started: 2026-07-28T13:38:38.122000+00:00
-- ended: 2026-07-28T13:38:40.624000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-20' AND bc_number = 0
                GROUP BY cohort_date
