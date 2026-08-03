-- job_id: 0d587372-46e9-4b33-a422-ce2a2b71408d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:42.427000+00:00
-- started: 2026-07-28T14:34:42.574000+00:00
-- ended: 2026-07-28T14:34:44.237000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-51' AND activity_date <= DATE('2026-07-27')
