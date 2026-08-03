-- job_id: 05eb0dc3-8d72-4d80-bfb9-87e7580c94ec
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:56.994000+00:00
-- started: 2026-08-03T12:26:57.083000+00:00
-- ended: 2026-08-03T12:26:58.620000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-45' AND activity_date <= DATE('2026-08-02')
