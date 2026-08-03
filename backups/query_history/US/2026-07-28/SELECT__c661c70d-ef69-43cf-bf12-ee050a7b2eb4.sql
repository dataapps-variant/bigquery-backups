-- job_id: c661c70d-ef69-43cf-bf12-ee050a7b2eb4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:16.761000+00:00
-- started: 2026-07-28T13:42:17.256000+00:00
-- ended: 2026-07-28T13:42:19.064000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-55' AND bc_number = 0
                GROUP BY cohort_date
