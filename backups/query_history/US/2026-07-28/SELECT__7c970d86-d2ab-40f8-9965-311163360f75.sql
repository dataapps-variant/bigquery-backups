-- job_id: 7c970d86-d2ab-40f8-9965-311163360f75
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:16.319000+00:00
-- started: 2026-07-28T10:02:16.425000+00:00
-- ended: 2026-07-28T10:02:18.225000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-24' AND activity_date <= DATE('2026-07-27')
