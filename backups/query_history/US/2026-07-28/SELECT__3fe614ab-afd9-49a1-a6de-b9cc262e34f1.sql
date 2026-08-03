-- job_id: 3fe614ab-afd9-49a1-a6de-b9cc262e34f1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:36.802000+00:00
-- started: 2026-07-28T10:05:36.896000+00:00
-- ended: 2026-07-28T10:05:37.812000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-40' AND activity_date <= DATE('2026-07-27')
