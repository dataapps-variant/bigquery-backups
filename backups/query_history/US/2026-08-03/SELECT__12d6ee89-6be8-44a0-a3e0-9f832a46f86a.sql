-- job_id: 12d6ee89-6be8-44a0-a3e0-9f832a46f86a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:36.327000+00:00
-- started: 2026-08-03T12:22:36.395000+00:00
-- ended: 2026-08-03T12:22:38.216000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-6' AND activity_date <= DATE('2026-08-02')
