-- job_id: bec95871-4341-46ee-a96d-75a2818fb77b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:15.504000+00:00
-- started: 2026-07-28T14:34:15.584000+00:00
-- ended: 2026-07-28T14:34:17.002000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-44' AND activity_date <= DATE('2026-07-27')
