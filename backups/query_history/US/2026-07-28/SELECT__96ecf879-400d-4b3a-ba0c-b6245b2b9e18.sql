-- job_id: 96ecf879-400d-4b3a-ba0c-b6245b2b9e18
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:20.383000+00:00
-- started: 2026-07-28T10:01:20.483000+00:00
-- ended: 2026-07-28T10:01:21.890000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-15' AND activity_date <= DATE('2026-07-27')
