-- job_id: 91ae266b-e792-460b-8408-403214399ee7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:30.893000+00:00
-- started: 2026-07-28T10:05:30.943000+00:00
-- ended: 2026-07-28T10:05:31.751000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-38' AND activity_date <= DATE('2026-07-27')
