-- job_id: 9f4e6a4b-b599-4a98-b1d9-0196ab5b7ea9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:07.809000+00:00
-- started: 2026-07-28T13:38:07.886000+00:00
-- ended: 2026-07-28T13:38:09.309000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-15' AND bc_number = 0
                GROUP BY cohort_date
