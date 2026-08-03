-- job_id: 655843c7-eb85-4a6d-849a-2b1189538875
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:49.202000+00:00
-- started: 2026-07-28T13:37:49.318000+00:00
-- ended: 2026-07-28T13:37:51.299000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-12' AND bc_number = 0
                GROUP BY cohort_date
