-- job_id: c3df5df6-4b76-4b12-ae17-20139d502d4b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:47.895000+00:00
-- started: 2026-07-28T10:04:47.944000+00:00
-- ended: 2026-07-28T10:04:49.451000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-52' AND activity_date <= DATE('2026-07-27')
