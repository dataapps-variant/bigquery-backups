-- job_id: 548d8b32-11e8-49ba-83bf-5e7b760e55b6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:41.427000+00:00
-- started: 2026-08-03T12:22:41.509000+00:00
-- ended: 2026-08-03T12:22:43.387000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-7' AND activity_date <= DATE('2026-08-02')
