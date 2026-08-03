-- job_id: 23bdb282-1e4d-46e9-a2d4-a53546a2d4a2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:47.076000+00:00
-- started: 2026-07-28T13:39:47.169000+00:00
-- ended: 2026-07-28T13:39:49.039000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-31' AND bc_number = 0
                GROUP BY cohort_date
