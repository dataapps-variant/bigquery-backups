-- job_id: 903b392c-748c-4ebb-b500-daf44a905fe1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:42.923000+00:00
-- started: 2026-07-28T14:32:42.987000+00:00
-- ended: 2026-07-28T14:32:44.553000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-29' AND activity_date <= DATE('2026-07-27')
