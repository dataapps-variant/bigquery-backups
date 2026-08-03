-- job_id: a6ad6c06-d13f-4ede-bda0-b3438c09ff3e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:38.501000+00:00
-- started: 2026-07-28T10:03:38.559000+00:00
-- ended: 2026-07-28T10:03:40.250000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-13' AND activity_date <= DATE('2026-07-27')
