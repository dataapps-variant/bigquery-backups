-- job_id: 348de488-3e9a-4c38-8e24-b064d4396a6e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:42.999000+00:00
-- started: 2026-07-28T10:06:43.041000+00:00
-- ended: 2026-07-28T10:06:43.775000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-57' AND activity_date <= DATE('2026-07-27')
