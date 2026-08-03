-- job_id: c5d9a940-2558-43d2-b70f-a55a8742a407
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:01.896000+00:00
-- started: 2026-07-28T10:04:01.952000+00:00
-- ended: 2026-07-28T10:04:03.409000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-17' AND activity_date <= DATE('2026-07-27')
