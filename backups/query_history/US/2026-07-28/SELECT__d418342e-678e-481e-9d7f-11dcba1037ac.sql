-- job_id: d418342e-678e-481e-9d7f-11dcba1037ac
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:59.239000+00:00
-- started: 2026-07-28T13:38:59.310000+00:00
-- ended: 2026-07-28T13:39:00.874000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-23' AND bc_number = 0
                GROUP BY cohort_date
