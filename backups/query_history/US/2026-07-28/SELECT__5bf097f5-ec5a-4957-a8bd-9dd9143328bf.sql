-- job_id: 5bf097f5-ec5a-4957-a8bd-9dd9143328bf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:24.552000+00:00
-- started: 2026-07-28T10:06:24.629000+00:00
-- ended: 2026-07-28T10:06:25.242000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-50' AND activity_date <= DATE('2026-07-27')
