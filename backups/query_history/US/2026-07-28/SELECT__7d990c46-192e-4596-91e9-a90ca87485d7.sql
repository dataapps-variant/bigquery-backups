-- job_id: 7d990c46-192e-4596-91e9-a90ca87485d7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:40.049000+00:00
-- started: 2026-07-28T10:04:40.099000+00:00
-- ended: 2026-07-28T10:04:41.334000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-50' AND activity_date <= DATE('2026-07-27')
