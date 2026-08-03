-- job_id: ed1b949a-354a-40bf-aef7-c10b33642a6b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:21.915000+00:00
-- started: 2026-07-28T10:05:21.992000+00:00
-- ended: 2026-07-28T10:05:24.408000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-59' AND activity_date <= DATE('2026-07-27')
