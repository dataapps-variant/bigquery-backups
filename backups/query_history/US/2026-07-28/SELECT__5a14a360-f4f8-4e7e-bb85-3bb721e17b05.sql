-- job_id: 5a14a360-f4f8-4e7e-bb85-3bb721e17b05
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:43.668000+00:00
-- started: 2026-07-28T10:04:43.717000+00:00
-- ended: 2026-07-28T10:04:45.218000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-51' AND activity_date <= DATE('2026-07-27')
