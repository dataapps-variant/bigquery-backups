-- job_id: 21eafd33-3a26-46f6-823c-5d0b034cb44e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:21.049000+00:00
-- started: 2026-07-28T10:03:21.124000+00:00
-- ended: 2026-07-28T10:03:22.712000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-10' AND activity_date <= DATE('2026-07-27')
