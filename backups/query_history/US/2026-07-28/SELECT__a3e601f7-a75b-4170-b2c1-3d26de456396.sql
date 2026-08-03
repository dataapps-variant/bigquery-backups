-- job_id: a3e601f7-a75b-4170-b2c1-3d26de456396
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:11.579000+00:00
-- started: 2026-07-28T10:06:11.641000+00:00
-- ended: 2026-07-28T10:06:12.314000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-45' AND activity_date <= DATE('2026-07-27')
