-- job_id: 341ccfba-e4f6-4097-b53e-1199fd5bac1c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:31.220000+00:00
-- started: 2026-07-28T14:33:31.316000+00:00
-- ended: 2026-07-28T14:33:32.841000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-38' AND activity_date <= DATE('2026-07-27')
