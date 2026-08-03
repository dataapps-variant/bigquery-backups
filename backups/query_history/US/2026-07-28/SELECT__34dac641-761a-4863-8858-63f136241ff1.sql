-- job_id: 34dac641-761a-4863-8858-63f136241ff1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:32.034000+00:00
-- started: 2026-07-28T13:38:32.107000+00:00
-- ended: 2026-07-28T13:38:33.644000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-19' AND bc_number = 0
                GROUP BY cohort_date
