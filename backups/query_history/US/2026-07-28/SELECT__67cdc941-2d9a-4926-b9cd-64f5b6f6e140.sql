-- job_id: 67cdc941-2d9a-4926-b9cd-64f5b6f6e140
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:18.258000+00:00
-- started: 2026-07-28T14:32:18.329000+00:00
-- ended: 2026-07-28T14:32:20.102000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-24' AND activity_date <= DATE('2026-07-27')
