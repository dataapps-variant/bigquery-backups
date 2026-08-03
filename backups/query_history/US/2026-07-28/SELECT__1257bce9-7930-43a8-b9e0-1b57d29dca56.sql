-- job_id: 1257bce9-7930-43a8-b9e0-1b57d29dca56
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:31.023000+00:00
-- started: 2026-07-28T14:34:31.106000+00:00
-- ended: 2026-07-28T14:34:32.379000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-48' AND activity_date <= DATE('2026-07-27')
