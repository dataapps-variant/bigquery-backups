-- job_id: ea7dbf42-edde-4e56-bbef-a32a49bd34c3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:08.477000+00:00
-- started: 2026-07-28T14:31:08.571000+00:00
-- ended: 2026-07-28T14:31:10.079000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-13' AND activity_date <= DATE('2026-07-27')
