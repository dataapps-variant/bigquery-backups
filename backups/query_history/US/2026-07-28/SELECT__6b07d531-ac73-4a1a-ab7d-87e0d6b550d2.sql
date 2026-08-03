-- job_id: 6b07d531-ac73-4a1a-ab7d-87e0d6b550d2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:47.730000+00:00
-- started: 2026-07-28T14:32:47.799000+00:00
-- ended: 2026-07-28T14:32:49.069000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-30' AND activity_date <= DATE('2026-07-27')
