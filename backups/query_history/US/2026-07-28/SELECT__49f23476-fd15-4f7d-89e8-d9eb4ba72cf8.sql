-- job_id: 49f23476-fd15-4f7d-89e8-d9eb4ba72cf8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:33.139000+00:00
-- started: 2026-07-28T10:02:33.241000+00:00
-- ended: 2026-07-28T10:02:34.926000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-3' AND activity_date <= DATE('2026-07-27')
