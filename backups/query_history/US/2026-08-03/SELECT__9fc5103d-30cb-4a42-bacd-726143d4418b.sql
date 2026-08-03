-- job_id: 9fc5103d-30cb-4a42-bacd-726143d4418b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:02.927000+00:00
-- started: 2026-08-03T12:28:02.980000+00:00
-- ended: 2026-08-03T12:28:05.288000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-58' AND activity_date <= DATE('2026-08-02')
