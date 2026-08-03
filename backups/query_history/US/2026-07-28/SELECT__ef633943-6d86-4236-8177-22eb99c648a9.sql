-- job_id: ef633943-6d86-4236-8177-22eb99c648a9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:34.501000+00:00
-- started: 2026-07-28T13:36:34.625000+00:00
-- ended: 2026-07-28T13:36:36.032000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-1' AND bc_number = 0
                GROUP BY cohort_date
