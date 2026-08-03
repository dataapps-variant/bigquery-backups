-- job_id: 8f928aa8-e64f-4e3e-98dc-9ce85758a55c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:08.979000+00:00
-- started: 2026-07-28T10:05:09.026000+00:00
-- ended: 2026-07-28T10:05:09.649000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-33' AND activity_date <= DATE('2026-07-27')
