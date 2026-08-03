-- job_id: f58e77e9-4bdc-4cbe-a953-002130000488
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:15.313000+00:00
-- started: 2026-07-28T14:33:15.407000+00:00
-- ended: 2026-07-28T14:33:17.316000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-36' AND activity_date <= DATE('2026-07-27')
