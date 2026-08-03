-- job_id: 74f8990b-8d1b-40ad-8b48-a43ce71eb288
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:50.079000+00:00
-- started: 2026-07-28T13:40:50.175000+00:00
-- ended: 2026-07-28T13:40:51.607000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-41' AND bc_number = 0
                GROUP BY cohort_date
