-- job_id: a2b2e6b3-84e7-4b97-83b2-e6941b83b2d6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:53.391000+00:00
-- started: 2026-07-28T13:38:53.443000+00:00
-- ended: 2026-07-28T13:38:55.115000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-22' AND bc_number = 0
                GROUP BY cohort_date
