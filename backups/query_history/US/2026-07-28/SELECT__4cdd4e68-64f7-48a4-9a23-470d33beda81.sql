-- job_id: 4cdd4e68-64f7-48a4-9a23-470d33beda81
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:04.129000+00:00
-- started: 2026-07-28T10:01:04.219000+00:00
-- ended: 2026-07-28T10:01:05.873000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-13' AND activity_date <= DATE('2026-07-27')
