-- job_id: da7487ac-4cfc-43e8-8f7b-5b2ab772590f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:54.384000+00:00
-- started: 2026-07-28T14:30:54.452000+00:00
-- ended: 2026-07-28T14:30:56.381000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-11' AND activity_date <= DATE('2026-07-27')
