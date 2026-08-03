-- job_id: 4028b815-1ed1-4d94-8492-b9c8dca93231
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:20.210000+00:00
-- started: 2026-07-28T10:00:20.287000+00:00
-- ended: 2026-07-28T10:00:22.593000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-8' AND activity_date <= DATE('2026-07-27')
