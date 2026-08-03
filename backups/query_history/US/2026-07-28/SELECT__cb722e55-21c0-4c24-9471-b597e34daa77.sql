-- job_id: cb722e55-21c0-4c24-9471-b597e34daa77
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:25.077000+00:00
-- started: 2026-07-28T10:01:25.208000+00:00
-- ended: 2026-07-28T10:01:26.602000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-16' AND activity_date <= DATE('2026-07-27')
