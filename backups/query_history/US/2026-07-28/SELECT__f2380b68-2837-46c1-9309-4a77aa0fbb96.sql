-- job_id: f2380b68-2837-46c1-9309-4a77aa0fbb96
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:35.199000+00:00
-- started: 2026-07-28T14:29:35.257000+00:00
-- ended: 2026-07-28T14:29:39.636000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-1' AND activity_date <= DATE('2026-07-27')
