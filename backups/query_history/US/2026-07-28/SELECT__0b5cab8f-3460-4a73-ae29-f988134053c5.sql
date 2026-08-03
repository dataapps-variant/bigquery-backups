-- job_id: 0b5cab8f-3460-4a73-ae29-f988134053c5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:33.291000+00:00
-- started: 2026-07-28T10:03:33.363000+00:00
-- ended: 2026-07-28T10:03:35.176000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-12' AND activity_date <= DATE('2026-07-27')
