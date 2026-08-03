-- job_id: dee44c21-f918-4e9b-b454-12540c3236bb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:52.781000+00:00
-- started: 2026-07-28T10:06:52.830000+00:00
-- ended: 2026-07-28T10:06:53.442000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-59' AND activity_date <= DATE('2026-07-27')
