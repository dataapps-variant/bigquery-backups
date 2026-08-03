-- job_id: 1f52e307-9f2f-40b0-881e-2f65a38c5dff
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:28.016000+00:00
-- started: 2026-07-28T14:32:28.096000+00:00
-- ended: 2026-07-28T14:32:29.541000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-26' AND activity_date <= DATE('2026-07-27')
