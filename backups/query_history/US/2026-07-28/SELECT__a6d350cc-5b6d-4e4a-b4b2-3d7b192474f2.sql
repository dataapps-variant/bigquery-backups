-- job_id: a6d350cc-5b6d-4e4a-b4b2-3d7b192474f2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:29.017000+00:00
-- started: 2026-07-28T10:03:29.098000+00:00
-- ended: 2026-07-28T10:03:30.540000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-38' AND activity_date <= DATE('2026-07-27')
