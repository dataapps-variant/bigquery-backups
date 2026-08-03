-- job_id: 2e27bb89-a497-416a-923e-aa3cd2cec62f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:14.444000+00:00
-- started: 2026-07-28T10:06:14.506000+00:00
-- ended: 2026-07-28T10:06:15.103000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-46' AND activity_date <= DATE('2026-07-27')
