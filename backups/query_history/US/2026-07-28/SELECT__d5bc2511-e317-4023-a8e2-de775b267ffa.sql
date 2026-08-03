-- job_id: d5bc2511-e317-4023-a8e2-de775b267ffa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:59.291000+00:00
-- started: 2026-07-28T10:02:59.408000+00:00
-- ended: 2026-07-28T10:03:01.128000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-33' AND activity_date <= DATE('2026-07-27')
