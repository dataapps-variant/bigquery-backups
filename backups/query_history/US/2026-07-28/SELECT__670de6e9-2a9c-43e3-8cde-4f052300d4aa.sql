-- job_id: 670de6e9-2a9c-43e3-8cde-4f052300d4aa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:31.850000+00:00
-- started: 2026-07-28T10:06:31.902000+00:00
-- ended: 2026-07-28T10:06:32.693000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-53' AND activity_date <= DATE('2026-07-27')
