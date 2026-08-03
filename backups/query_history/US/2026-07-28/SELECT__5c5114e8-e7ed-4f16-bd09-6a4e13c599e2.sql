-- job_id: 5c5114e8-e7ed-4f16-bd09-6a4e13c599e2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:19.407000+00:00
-- started: 2026-07-28T10:04:19.505000+00:00
-- ended: 2026-07-28T10:04:21.638000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-45' AND activity_date <= DATE('2026-07-27')
