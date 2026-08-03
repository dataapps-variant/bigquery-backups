-- job_id: 516a57dd-d6c9-4f23-a96b-9454ca88e0fe
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:01.923000+00:00
-- started: 2026-07-28T10:05:01.970000+00:00
-- ended: 2026-07-28T10:05:02.554000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-31' AND activity_date <= DATE('2026-07-27')
