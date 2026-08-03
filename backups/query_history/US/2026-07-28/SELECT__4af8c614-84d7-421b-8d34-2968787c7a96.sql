-- job_id: 4af8c614-84d7-421b-8d34-2968787c7a96
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:01.690000+00:00
-- started: 2026-07-28T13:38:01.756000+00:00
-- ended: 2026-07-28T13:38:03.016000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-14' AND bc_number = 0
                GROUP BY cohort_date
