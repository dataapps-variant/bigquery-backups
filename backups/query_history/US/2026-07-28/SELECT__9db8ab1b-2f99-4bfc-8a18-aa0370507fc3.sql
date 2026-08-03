-- job_id: 9db8ab1b-2f99-4bfc-8a18-aa0370507fc3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:14.505000+00:00
-- started: 2026-07-28T14:30:15.038000+00:00
-- ended: 2026-07-28T14:30:16.494000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-6' AND activity_date <= DATE('2026-07-27')
