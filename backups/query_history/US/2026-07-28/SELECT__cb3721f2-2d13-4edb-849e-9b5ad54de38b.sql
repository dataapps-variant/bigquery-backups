-- job_id: cb3721f2-2d13-4edb-849e-9b5ad54de38b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:47.323000+00:00
-- started: 2026-07-28T14:33:47.414000+00:00
-- ended: 2026-07-28T14:33:48.646000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-42' AND activity_date <= DATE('2026-07-27')
