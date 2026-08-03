-- job_id: b85ed673-6587-4750-9777-e7a43d3e38fb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:29.025000+00:00
-- started: 2026-07-28T13:39:29.108000+00:00
-- ended: 2026-07-28T13:39:30.890000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-28' AND bc_number = 0
                GROUP BY cohort_date
