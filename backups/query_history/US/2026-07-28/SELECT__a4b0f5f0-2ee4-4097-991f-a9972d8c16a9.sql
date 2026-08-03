-- job_id: a4b0f5f0-2ee4-4097-991f-a9972d8c16a9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:17.786000+00:00
-- started: 2026-07-28T10:05:17.867000+00:00
-- ended: 2026-07-28T10:05:19.311000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-58' AND activity_date <= DATE('2026-07-27')
