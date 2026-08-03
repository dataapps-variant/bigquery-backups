-- job_id: 7409f337-902a-4ed9-9f51-45d6e6e471d0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:59.333000+00:00
-- started: 2026-07-28T13:39:59.415000+00:00
-- ended: 2026-07-28T13:40:00.817000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-33' AND bc_number = 0
                GROUP BY cohort_date
