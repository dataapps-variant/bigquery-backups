-- job_id: 28bf4d2c-e62a-442a-a133-a45706367444
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:48.928000+00:00
-- started: 2026-07-28T09:59:49.041000+00:00
-- ended: 2026-07-28T09:59:50.538000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-2' AND activity_date <= DATE('2026-07-27')
