-- job_id: 9e2cd60b-01d5-42b7-8242-a8d0383f0ff5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:19.132000+00:00
-- started: 2026-07-28T14:30:19.205000+00:00
-- ended: 2026-07-28T14:30:20.544000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-7' AND activity_date <= DATE('2026-07-27')
