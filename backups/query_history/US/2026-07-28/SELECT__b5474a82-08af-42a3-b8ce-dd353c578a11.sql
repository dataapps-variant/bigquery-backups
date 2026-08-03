-- job_id: b5474a82-08af-42a3-b8ce-dd353c578a11
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:29.289000+00:00
-- started: 2026-07-28T10:01:29.393000+00:00
-- ended: 2026-07-28T10:01:30.765000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-17' AND activity_date <= DATE('2026-07-27')
