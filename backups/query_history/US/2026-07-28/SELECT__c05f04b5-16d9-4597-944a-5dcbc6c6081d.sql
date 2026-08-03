-- job_id: c05f04b5-16d9-4597-944a-5dcbc6c6081d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:34.374000+00:00
-- started: 2026-07-28T13:41:34.493000+00:00
-- ended: 2026-07-28T13:41:35.989000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-48' AND bc_number = 0
                GROUP BY cohort_date
