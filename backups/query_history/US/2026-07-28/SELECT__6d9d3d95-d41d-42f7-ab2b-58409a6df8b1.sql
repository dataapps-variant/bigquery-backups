-- job_id: 6d9d3d95-d41d-42f7-ab2b-58409a6df8b1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:54.959000+00:00
-- started: 2026-07-28T14:34:55.040000+00:00
-- ended: 2026-07-28T14:34:56.390000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-54' AND activity_date <= DATE('2026-07-27')
