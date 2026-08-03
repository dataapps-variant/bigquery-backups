-- job_id: 6c3808cd-b3f4-40cf-9411-d170bda1793a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:09.226000+00:00
-- started: 2026-07-28T10:06:09.276000+00:00
-- ended: 2026-07-28T10:06:09.834000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-44' AND activity_date <= DATE('2026-07-27')
