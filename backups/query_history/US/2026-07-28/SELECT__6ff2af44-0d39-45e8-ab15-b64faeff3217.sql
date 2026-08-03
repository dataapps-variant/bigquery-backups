-- job_id: 6ff2af44-0d39-45e8-ab15-b64faeff3217
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:59.149000+00:00
-- started: 2026-07-28T14:34:59.206000+00:00
-- ended: 2026-07-28T14:35:01.020000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-55' AND activity_date <= DATE('2026-07-27')
