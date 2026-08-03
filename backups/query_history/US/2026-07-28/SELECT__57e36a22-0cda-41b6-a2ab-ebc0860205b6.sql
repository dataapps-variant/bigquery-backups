-- job_id: 57e36a22-0cda-41b6-a2ab-ebc0860205b6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:45.408000+00:00
-- started: 2026-07-28T13:38:45.524000+00:00
-- ended: 2026-07-28T13:38:46.786000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-21' AND bc_number = 1
                GROUP BY cohort_date
