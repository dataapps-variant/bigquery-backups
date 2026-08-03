-- job_id: 1ca601d3-215c-4c2f-bcdf-6ba71f1a0059
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:22.090000+00:00
-- started: 2026-07-28T10:06:22.152000+00:00
-- ended: 2026-07-28T10:06:22.696000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-49' AND activity_date <= DATE('2026-07-27')
