-- job_id: 289f02da-0a3b-4177-9a13-3192f428086f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:50.246000+00:00
-- started: 2026-07-28T10:03:50.584000+00:00
-- ended: 2026-07-28T10:03:52.567000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-43' AND activity_date <= DATE('2026-07-27')
