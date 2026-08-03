-- job_id: ef34a2fc-7ed2-4eae-8eab-1dcafd132d66
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:33.800000+00:00
-- started: 2026-07-28T10:05:33.876000+00:00
-- ended: 2026-07-28T10:05:34.755000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-39' AND activity_date <= DATE('2026-07-27')
