-- job_id: 7fa52911-8b66-43f8-8638-a3a3a4e15095
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:15.213000+00:00
-- started: 2026-07-28T10:04:15.513000+00:00
-- ended: 2026-07-28T10:04:17.034000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-44' AND activity_date <= DATE('2026-07-27')
