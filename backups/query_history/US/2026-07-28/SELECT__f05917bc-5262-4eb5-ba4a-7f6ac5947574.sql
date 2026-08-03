-- job_id: f05917bc-5262-4eb5-ba4a-7f6ac5947574
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:43.548000+00:00
-- started: 2026-07-28T14:33:43.620000+00:00
-- ended: 2026-07-28T14:33:44.916000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-41' AND activity_date <= DATE('2026-07-27')
