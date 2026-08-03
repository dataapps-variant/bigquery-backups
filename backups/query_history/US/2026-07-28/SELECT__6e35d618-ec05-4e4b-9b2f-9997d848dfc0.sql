-- job_id: 6e35d618-ec05-4e4b-9b2f-9997d848dfc0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:01.610000+00:00
-- started: 2026-07-28T14:33:01.784000+00:00
-- ended: 2026-07-28T14:33:03.450000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-33' AND activity_date <= DATE('2026-07-27')
