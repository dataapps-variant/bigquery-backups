-- job_id: 6266783b-c593-4c97-b681-f93deb21664b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:15.437000+00:00
-- started: 2026-07-28T10:00:15.545000+00:00
-- ended: 2026-07-28T10:00:17.115000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-7' AND activity_date <= DATE('2026-07-27')
