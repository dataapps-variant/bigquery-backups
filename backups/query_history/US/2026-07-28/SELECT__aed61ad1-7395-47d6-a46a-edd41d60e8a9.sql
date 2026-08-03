-- job_id: aed61ad1-7395-47d6-a46a-edd41d60e8a9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:35.152000+00:00
-- started: 2026-07-28T13:39:35.244000+00:00
-- ended: 2026-07-28T13:39:36.659000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-29' AND bc_number = 0
                GROUP BY cohort_date
