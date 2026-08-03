-- job_id: 5f80e03f-195b-40c9-955e-0311f0dcb3ae
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:39.669000+00:00
-- started: 2026-07-28T10:05:39.733000+00:00
-- ended: 2026-07-28T10:05:40.296000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-41' AND activity_date <= DATE('2026-07-27')
