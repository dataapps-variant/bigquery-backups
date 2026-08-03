-- job_id: e8a7ab59-22ed-4ce9-b4e5-cf5101dbbb35
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:50.090000+00:00
-- started: 2026-07-28T14:30:50.167000+00:00
-- ended: 2026-07-28T14:30:51.609000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-10' AND activity_date <= DATE('2026-07-27')
