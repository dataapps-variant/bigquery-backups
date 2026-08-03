-- job_id: d4be0cdb-8358-4037-8054-504ff39cd08a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:24.185000+00:00
-- started: 2026-07-28T10:04:24.260000+00:00
-- ended: 2026-07-28T10:04:25.987000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-21' AND activity_date <= DATE('2026-07-27')
