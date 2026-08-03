-- job_id: 65b2c41c-5037-4232-b5f7-fda8f593e88e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:57.975000+00:00
-- started: 2026-07-28T10:03:58.057000+00:00
-- ended: 2026-07-28T10:03:59.829000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-16' AND activity_date <= DATE('2026-07-27')
