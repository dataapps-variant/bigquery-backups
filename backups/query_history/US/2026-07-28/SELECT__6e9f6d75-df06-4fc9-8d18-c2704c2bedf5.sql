-- job_id: 6e9f6d75-df06-4fc9-8d18-c2704c2bedf5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:43.341000+00:00
-- started: 2026-07-28T10:05:43.390000+00:00
-- ended: 2026-07-28T10:05:43.950000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-42' AND activity_date <= DATE('2026-07-27')
