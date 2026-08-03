-- job_id: 46d5c3ba-e8b5-4775-9458-9ab216a7a870
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:33.923000+00:00
-- started: 2026-07-28T10:04:33.978000+00:00
-- ended: 2026-07-28T10:04:35.578000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-22' AND activity_date <= DATE('2026-07-27')
