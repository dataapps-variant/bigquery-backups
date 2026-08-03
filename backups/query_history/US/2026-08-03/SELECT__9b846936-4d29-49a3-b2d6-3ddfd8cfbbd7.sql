-- job_id: 9b846936-4d29-49a3-b2d6-3ddfd8cfbbd7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:29.303000+00:00
-- started: 2026-08-03T12:25:29.379000+00:00
-- ended: 2026-08-03T12:25:31.090000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-32' AND activity_date <= DATE('2026-08-02')
