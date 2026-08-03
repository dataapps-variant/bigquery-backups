-- job_id: a28d3a3b-9ffb-4596-a0ba-9e6f03d3f14f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:47.894000+00:00
-- started: 2026-07-28T10:02:47.978000+00:00
-- ended: 2026-07-28T10:02:49.383000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-6' AND activity_date <= DATE('2026-07-27')
