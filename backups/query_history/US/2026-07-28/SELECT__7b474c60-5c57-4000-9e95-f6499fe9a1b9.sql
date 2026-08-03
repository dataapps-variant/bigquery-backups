-- job_id: 7b474c60-5c57-4000-9e95-f6499fe9a1b9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:23.299000+00:00
-- started: 2026-07-28T14:34:23.367000+00:00
-- ended: 2026-07-28T14:34:24.938000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-46' AND activity_date <= DATE('2026-07-27')
