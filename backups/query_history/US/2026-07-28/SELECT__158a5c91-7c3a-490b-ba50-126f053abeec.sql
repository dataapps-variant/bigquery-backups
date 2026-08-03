-- job_id: 158a5c91-7c3a-490b-ba50-126f053abeec
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:44.067000+00:00
-- started: 2026-07-28T13:40:44.145000+00:00
-- ended: 2026-07-28T13:40:45.542000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-40' AND bc_number = 0
                GROUP BY cohort_date
