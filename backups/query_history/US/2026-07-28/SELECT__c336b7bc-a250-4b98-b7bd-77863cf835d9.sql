-- job_id: c336b7bc-a250-4b98-b7bd-77863cf835d9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:32.176000+00:00
-- started: 2026-07-28T13:40:32.257000+00:00
-- ended: 2026-07-28T13:40:33.826000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-38' AND bc_number = 0
                GROUP BY cohort_date
