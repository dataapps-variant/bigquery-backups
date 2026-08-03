-- job_id: 7eddefa3-c5f3-4f0a-96a2-404bd1f29026
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:54.040000+00:00
-- started: 2026-07-28T09:59:54.120000+00:00
-- ended: 2026-07-28T09:59:55.442000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-3' AND activity_date <= DATE('2026-07-27')
