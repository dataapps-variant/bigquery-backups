-- job_id: e8016225-5aea-45f5-ab44-bf2b20d051d2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:53.785000+00:00
-- started: 2026-08-03T12:27:53.855000+00:00
-- ended: 2026-08-03T12:27:55.666000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-57' AND activity_date <= DATE('2026-08-02')
