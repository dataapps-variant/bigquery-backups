-- job_id: f7218575-1173-4249-a00b-8a46071c91ab
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:47.645000+00:00
-- started: 2026-07-28T10:04:47.734000+00:00
-- ended: 2026-07-28T10:04:48.472000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-26' AND activity_date <= DATE('2026-07-27')
