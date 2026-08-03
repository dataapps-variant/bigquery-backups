-- job_id: bc7c9191-22c3-4bd3-b5b7-3fd10d6283fb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:37.964000+00:00
-- started: 2026-07-28T10:06:38.015000+00:00
-- ended: 2026-07-28T10:06:38.590000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-55' AND activity_date <= DATE('2026-07-27')
