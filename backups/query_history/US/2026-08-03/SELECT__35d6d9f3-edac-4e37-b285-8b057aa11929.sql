-- job_id: 35d6d9f3-edac-4e37-b285-8b057aa11929
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:30.414000+00:00
-- started: 2026-08-03T12:22:30.577000+00:00
-- ended: 2026-08-03T12:22:32.565000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-5' AND activity_date <= DATE('2026-08-02')
