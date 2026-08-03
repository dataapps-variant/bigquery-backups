-- job_id: 27c25e06-1361-4339-9364-2d64cec7fee9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:53.603000+00:00
-- started: 2026-07-28T10:03:53.654000+00:00
-- ended: 2026-07-28T10:03:55.114000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-15' AND activity_date <= DATE('2026-07-27')
