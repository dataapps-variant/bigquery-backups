-- job_id: 3cef4910-2d0b-452d-b5c8-4cea3d01758f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:44.876000+00:00
-- started: 2026-07-28T10:04:44.952000+00:00
-- ended: 2026-07-28T10:04:45.552000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-25' AND activity_date <= DATE('2026-07-27')
