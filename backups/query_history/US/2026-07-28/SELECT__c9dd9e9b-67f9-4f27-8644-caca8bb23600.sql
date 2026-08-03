-- job_id: c9dd9e9b-67f9-4f27-8644-caca8bb23600
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:51.627000+00:00
-- started: 2026-07-28T14:33:51.664000+00:00
-- ended: 2026-07-28T14:33:53.395000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-43' AND activity_date <= DATE('2026-07-27')
