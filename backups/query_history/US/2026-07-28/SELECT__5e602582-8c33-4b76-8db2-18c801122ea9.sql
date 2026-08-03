-- job_id: 5e602582-8c33-4b76-8db2-18c801122ea9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:24.416000+00:00
-- started: 2026-07-28T14:31:24.535000+00:00
-- ended: 2026-07-28T14:31:26.223000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-15' AND activity_date <= DATE('2026-07-27')
