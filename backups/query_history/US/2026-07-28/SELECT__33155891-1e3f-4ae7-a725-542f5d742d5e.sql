-- job_id: 33155891-1e3f-4ae7-a725-542f5d742d5e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:26.343000+00:00
-- started: 2026-07-28T10:02:26.418000+00:00
-- ended: 2026-07-28T10:02:27.979000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-26' AND activity_date <= DATE('2026-07-27')
