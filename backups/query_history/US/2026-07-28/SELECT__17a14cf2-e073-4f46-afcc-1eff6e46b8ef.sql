-- job_id: 17a14cf2-e073-4f46-afcc-1eff6e46b8ef
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:42.403000+00:00
-- started: 2026-07-28T14:31:42.480000+00:00
-- ended: 2026-07-28T14:31:43.919000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-19' AND activity_date <= DATE('2026-07-27')
