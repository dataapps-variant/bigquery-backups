-- job_id: 46fe7d79-b429-47fb-89be-fa6dbdc55ae8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:28.357000+00:00
-- started: 2026-07-28T10:05:28.421000+00:00
-- ended: 2026-07-28T10:05:28.990000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-37' AND activity_date <= DATE('2026-07-27')
