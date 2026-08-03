-- job_id: 39b78cd2-45a2-4605-b384-cd4303600395
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:22.205000+00:00
-- started: 2026-07-28T14:35:22.299000+00:00
-- ended: 2026-07-28T14:35:24.507000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-59' AND activity_date <= DATE('2026-07-27')
