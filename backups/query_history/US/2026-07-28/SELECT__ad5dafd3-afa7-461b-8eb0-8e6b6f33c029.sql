-- job_id: ad5dafd3-afa7-461b-8eb0-8e6b6f33c029
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:38.514000+00:00
-- started: 2026-07-28T14:34:38.589000+00:00
-- ended: 2026-07-28T14:34:40.031000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-50' AND activity_date <= DATE('2026-07-27')
