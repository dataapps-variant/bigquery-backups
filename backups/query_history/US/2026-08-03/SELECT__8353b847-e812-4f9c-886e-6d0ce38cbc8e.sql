-- job_id: 8353b847-e812-4f9c-886e-6d0ce38cbc8e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:54.372000+00:00
-- started: 2026-08-03T12:24:54.481000+00:00
-- ended: 2026-08-03T12:24:56.709000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-25' AND activity_date <= DATE('2026-08-02')
