-- job_id: 41865a98-16c7-4fa6-b7ae-14af1515353c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:55.790000+00:00
-- started: 2026-07-28T10:02:55.895000+00:00
-- ended: 2026-07-28T10:02:57.815000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-8' AND activity_date <= DATE('2026-07-27')
