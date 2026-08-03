-- job_id: 39118001-8acd-4df1-9ef2-0f8ea5e22987
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:50.104000+00:00
-- started: 2026-07-28T10:02:50.196000+00:00
-- ended: 2026-07-28T10:02:51.736000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-31' AND activity_date <= DATE('2026-07-27')
