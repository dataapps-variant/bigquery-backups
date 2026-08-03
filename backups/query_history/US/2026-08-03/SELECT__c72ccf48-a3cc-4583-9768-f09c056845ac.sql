-- job_id: c72ccf48-a3cc-4583-9768-f09c056845ac
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:45.987000+00:00
-- started: 2026-08-03T12:22:46.078000+00:00
-- ended: 2026-08-03T12:22:49.107000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-8' AND activity_date <= DATE('2026-08-02')
