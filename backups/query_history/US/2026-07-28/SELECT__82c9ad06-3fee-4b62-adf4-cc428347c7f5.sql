-- job_id: 82c9ad06-3fee-4b62-adf4-cc428347c7f5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:45.571000+00:00
-- started: 2026-07-28T10:03:45.639000+00:00
-- ended: 2026-07-28T10:03:47.144000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-42' AND activity_date <= DATE('2026-07-27')
