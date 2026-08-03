-- job_id: aea5f8fb-5fe1-4cb2-a561-bb024eb70991
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:14.604000+00:00
-- started: 2026-07-28T10:05:14.646000+00:00
-- ended: 2026-07-28T10:05:15.225000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-35' AND activity_date <= DATE('2026-07-27')
