-- job_id: 6766e850-52d6-4f33-88e9-4dd6444d658f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:01.402000+00:00
-- started: 2026-08-03T12:26:01.474000+00:00
-- ended: 2026-08-03T12:26:03.567000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-37' AND activity_date <= DATE('2026-08-02')
