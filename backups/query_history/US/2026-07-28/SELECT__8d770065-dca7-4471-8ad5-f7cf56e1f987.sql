-- job_id: 8d770065-dca7-4471-8ad5-f7cf56e1f987
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:26.686000+00:00
-- started: 2026-07-28T13:40:26.778000+00:00
-- ended: 2026-07-28T13:40:28.194000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-37' AND bc_number = 0
                GROUP BY cohort_date
