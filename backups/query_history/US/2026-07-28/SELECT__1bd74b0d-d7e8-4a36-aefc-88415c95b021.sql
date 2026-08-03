-- job_id: 1bd74b0d-d7e8-4a36-aefc-88415c95b021
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:27.691000+00:00
-- started: 2026-07-28T10:04:27.747000+00:00
-- ended: 2026-07-28T10:04:29.517000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-47' AND activity_date <= DATE('2026-07-27')
