-- job_id: 52f09b75-e694-4baa-ae44-89428505bd13
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:07.720000+00:00
-- started: 2026-07-28T14:35:08.532000+00:00
-- ended: 2026-07-28T14:35:10.140000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-57' AND activity_date <= DATE('2026-07-27')
