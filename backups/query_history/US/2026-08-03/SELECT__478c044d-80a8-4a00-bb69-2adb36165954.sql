-- job_id: 478c044d-80a8-4a00-bb69-2adb36165954
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:39.183000+00:00
-- started: 2026-08-03T12:25:39.288000+00:00
-- ended: 2026-08-03T12:25:41.515000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-34' AND activity_date <= DATE('2026-08-02')
