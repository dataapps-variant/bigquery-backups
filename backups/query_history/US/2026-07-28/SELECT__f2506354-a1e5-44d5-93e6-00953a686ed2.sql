-- job_id: f2506354-a1e5-44d5-93e6-00953a686ed2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:46.461000+00:00
-- started: 2026-07-28T10:05:46.521000+00:00
-- ended: 2026-07-28T10:05:47.082000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-43' AND activity_date <= DATE('2026-07-27')
