-- job_id: ce4a4f50-7317-425b-ac45-6df34e7477be
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:19.686000+00:00
-- started: 2026-07-28T13:38:19.780000+00:00
-- ended: 2026-07-28T13:38:21.420000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-17' AND bc_number = 0
                GROUP BY cohort_date
