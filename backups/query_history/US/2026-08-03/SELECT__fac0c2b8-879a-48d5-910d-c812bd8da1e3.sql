-- job_id: fac0c2b8-879a-48d5-910d-c812bd8da1e3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:59.838000+00:00
-- started: 2026-08-03T12:24:59.931000+00:00
-- ended: 2026-08-03T12:25:01.741000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-26' AND activity_date <= DATE('2026-08-02')
