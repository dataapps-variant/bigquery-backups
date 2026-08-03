-- job_id: 9f86f250-3bbe-473c-b57c-aeaa933e65c6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:42.990000+00:00
-- started: 2026-07-28T13:37:43.087000+00:00
-- ended: 2026-07-28T13:37:44.470000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-11' AND bc_number = 0
                GROUP BY cohort_date
