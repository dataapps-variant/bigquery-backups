-- job_id: 06871af8-b2a0-44f3-9539-87688fa05016
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:37.747000+00:00
-- started: 2026-07-28T10:04:37.839000+00:00
-- ended: 2026-07-28T10:04:38.564000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-23' AND activity_date <= DATE('2026-07-27')
