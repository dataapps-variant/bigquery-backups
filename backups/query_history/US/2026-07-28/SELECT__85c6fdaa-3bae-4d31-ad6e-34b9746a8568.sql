-- job_id: 85c6fdaa-3bae-4d31-ad6e-34b9746a8568
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:40.452000+00:00
-- started: 2026-07-28T10:02:40.518000+00:00
-- ended: 2026-07-28T10:02:43.432000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-29' AND activity_date <= DATE('2026-07-27')
