-- job_id: 943c28bc-7996-4c62-9182-2ef112eed7b0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:11.944000+00:00
-- started: 2026-07-28T10:05:12.040000+00:00
-- ended: 2026-07-28T10:05:12.718000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-34' AND activity_date <= DATE('2026-07-27')
