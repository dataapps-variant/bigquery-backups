-- job_id: 2f46457c-bdac-4f25-8c49-93009dc9fb4e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:10.928000+00:00
-- started: 2026-08-03T12:27:10.974000+00:00
-- ended: 2026-08-03T12:27:12.947000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-48' AND activity_date <= DATE('2026-08-02')
