-- job_id: 9725081a-563c-49d2-81a7-9fac1a88762f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:27.084000+00:00
-- started: 2026-07-28T10:06:27.154000+00:00
-- ended: 2026-07-28T10:06:27.802000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-51' AND activity_date <= DATE('2026-07-27')
