-- job_id: 438709e6-4ac5-4699-b45a-61834d86365f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:12.820000+00:00
-- started: 2026-07-28T10:03:12.872000+00:00
-- ended: 2026-07-28T10:03:15.162000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-36' AND activity_date <= DATE('2026-07-27')
