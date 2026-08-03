-- job_id: 9749f6cc-1992-4f3c-b05a-af4e406bc614
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:51.979000+00:00
-- started: 2026-07-28T14:29:52.060000+00:00
-- ended: 2026-07-28T14:29:54.803000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-2' AND activity_date <= DATE('2026-07-27')
