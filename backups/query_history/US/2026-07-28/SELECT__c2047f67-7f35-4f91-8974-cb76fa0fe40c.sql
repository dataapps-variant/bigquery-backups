-- job_id: c2047f67-7f35-4f91-8974-cb76fa0fe40c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:35.721000+00:00
-- started: 2026-07-28T10:02:35.798000+00:00
-- ended: 2026-07-28T10:02:37.669000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-28' AND activity_date <= DATE('2026-07-27')
