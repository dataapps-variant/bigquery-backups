-- job_id: 818824e3-02ac-48a7-bf70-2ae7d9a72410
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:11.042000+00:00
-- started: 2026-07-28T13:42:11.095000+00:00
-- ended: 2026-07-28T13:42:12.493000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-54' AND bc_number = 0
                GROUP BY cohort_date
