-- job_id: 9fe4a7e8-2fef-4348-b3c7-857a887d8bf8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:41.127000+00:00
-- started: 2026-07-28T10:02:41.195000+00:00
-- ended: 2026-07-28T10:02:42.806000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-5' AND activity_date <= DATE('2026-07-27')
