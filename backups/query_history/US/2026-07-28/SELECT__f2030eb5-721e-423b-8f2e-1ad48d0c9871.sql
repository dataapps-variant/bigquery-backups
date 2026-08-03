-- job_id: f2030eb5-721e-423b-8f2e-1ad48d0c9871
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:46.869000+00:00
-- started: 2026-07-28T14:34:46.933000+00:00
-- ended: 2026-07-28T14:34:48.324000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-52' AND activity_date <= DATE('2026-07-27')
