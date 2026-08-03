-- job_id: 9f1c84b3-334b-40a9-8dc7-03cf05ee4ab9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:50.790000+00:00
-- started: 2026-07-28T10:04:50.862000+00:00
-- ended: 2026-07-28T10:04:51.782000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-27' AND activity_date <= DATE('2026-07-27')
