-- job_id: e79c85a9-6e81-4cc9-9062-45e463390f7c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:13.688000+00:00
-- started: 2026-08-03T12:23:13.821000+00:00
-- ended: 2026-08-03T12:23:15.770000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-10' AND activity_date <= DATE('2026-08-02')
