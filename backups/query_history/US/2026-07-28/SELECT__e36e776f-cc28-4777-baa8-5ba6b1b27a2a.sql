-- job_id: e36e776f-cc28-4777-baa8-5ba6b1b27a2a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:09.949000+00:00
-- started: 2026-07-28T13:41:10.002000+00:00
-- ended: 2026-07-28T13:41:11.950000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-44' AND bc_number = 0
                GROUP BY cohort_date
