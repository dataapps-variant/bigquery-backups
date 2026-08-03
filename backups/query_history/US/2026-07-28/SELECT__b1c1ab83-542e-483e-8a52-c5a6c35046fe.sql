-- job_id: b1c1ab83-542e-483e-8a52-c5a6c35046fe
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:27.460000+00:00
-- started: 2026-07-28T14:33:27.535000+00:00
-- ended: 2026-07-28T14:33:28.780000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-37' AND activity_date <= DATE('2026-07-27')
