-- job_id: 4ad8423f-f854-4eb7-a93a-c356f44105a8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:38.503000+00:00
-- started: 2026-08-03T12:27:38.562000+00:00
-- ended: 2026-08-03T12:27:40.847000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-54' AND activity_date <= DATE('2026-08-02')
