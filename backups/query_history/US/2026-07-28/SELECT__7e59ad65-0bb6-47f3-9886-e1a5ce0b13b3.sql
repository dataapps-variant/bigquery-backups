-- job_id: 7e59ad65-0bb6-47f3-9886-e1a5ce0b13b3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:03.078000+00:00
-- started: 2026-07-28T14:31:03.127000+00:00
-- ended: 2026-07-28T14:31:04.589000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-12' AND activity_date <= DATE('2026-07-27')
