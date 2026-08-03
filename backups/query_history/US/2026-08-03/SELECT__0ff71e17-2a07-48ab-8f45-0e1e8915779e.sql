-- job_id: 0ff71e17-2a07-48ab-8f45-0e1e8915779e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:04.559000+00:00
-- started: 2026-08-03T12:25:04.637000+00:00
-- ended: 2026-08-03T12:25:06.717000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-27' AND activity_date <= DATE('2026-08-02')
