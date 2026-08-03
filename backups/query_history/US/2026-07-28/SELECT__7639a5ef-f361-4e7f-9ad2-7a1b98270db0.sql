-- job_id: 7639a5ef-f361-4e7f-9ad2-7a1b98270db0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:02.455000+00:00
-- started: 2026-07-28T10:00:02.552000+00:00
-- ended: 2026-07-28T10:00:04.206000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-5' AND activity_date <= DATE('2026-07-27')
