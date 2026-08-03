-- job_id: cc9bc6d9-b7ca-48a6-b594-6a4f68ad9c50
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:23.727000+00:00
-- started: 2026-07-28T10:04:23.797000+00:00
-- ended: 2026-07-28T10:04:25.312000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-46' AND activity_date <= DATE('2026-07-27')
