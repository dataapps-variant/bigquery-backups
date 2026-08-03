-- job_id: 8843e874-68c7-40d8-bd6a-a342ae9b5522
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:56.604000+00:00
-- started: 2026-07-28T10:04:56.765000+00:00
-- ended: 2026-07-28T10:04:57.325000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-29' AND activity_date <= DATE('2026-07-27')
