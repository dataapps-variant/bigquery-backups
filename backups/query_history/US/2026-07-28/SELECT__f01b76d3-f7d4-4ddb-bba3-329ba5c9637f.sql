-- job_id: f01b76d3-f7d4-4ddb-bba3-329ba5c9637f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:57.845000+00:00
-- started: 2026-07-28T09:59:57.956000+00:00
-- ended: 2026-07-28T09:59:59.661000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-4' AND activity_date <= DATE('2026-07-27')
