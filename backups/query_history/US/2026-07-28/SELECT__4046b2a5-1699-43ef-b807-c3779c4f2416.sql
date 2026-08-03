-- job_id: 4046b2a5-1699-43ef-b807-c3779c4f2416
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:04.671000+00:00
-- started: 2026-07-28T13:42:04.764000+00:00
-- ended: 2026-07-28T13:42:06.615000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-53' AND bc_number = 0
                GROUP BY cohort_date
