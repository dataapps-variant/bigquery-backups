-- job_id: ef3f855e-1852-465c-9bf6-c755acb2ccbb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:05.199000+00:00
-- started: 2026-07-28T10:04:05.294000+00:00
-- ended: 2026-07-28T10:04:06.756000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-18' AND activity_date <= DATE('2026-07-27')
