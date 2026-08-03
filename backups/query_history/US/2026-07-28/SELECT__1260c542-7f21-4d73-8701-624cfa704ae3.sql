-- job_id: 1260c542-7f21-4d73-8701-624cfa704ae3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:49.287000+00:00
-- started: 2026-07-28T13:36:49.367000+00:00
-- ended: 2026-07-28T13:36:50.797000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-3' AND bc_number = 0
                GROUP BY cohort_date
