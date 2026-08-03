-- job_id: 11c621a4-d258-44a6-8765-4ee682b9b53d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:16.151000+00:00
-- started: 2026-07-28T13:41:16.225000+00:00
-- ended: 2026-07-28T13:41:17.879000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-45' AND bc_number = 0
                GROUP BY cohort_date
