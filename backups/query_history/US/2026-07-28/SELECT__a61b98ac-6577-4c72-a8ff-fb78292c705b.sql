-- job_id: a61b98ac-6577-4c72-a8ff-fb78292c705b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:25.981000+00:00
-- started: 2026-07-28T13:38:26.073000+00:00
-- ended: 2026-07-28T13:38:27.487000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-18' AND bc_number = 0
                GROUP BY cohort_date
