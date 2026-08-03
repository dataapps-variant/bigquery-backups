-- job_id: 3b8fe2af-db63-4b47-a01a-e7da73b06742
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:30.824000+00:00
-- started: 2026-07-28T13:42:30.909000+00:00
-- ended: 2026-07-28T13:42:32.261000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-57' AND bc_number = 0
                GROUP BY cohort_date
