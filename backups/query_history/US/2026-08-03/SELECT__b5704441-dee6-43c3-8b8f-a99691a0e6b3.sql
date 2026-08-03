-- job_id: b5704441-dee6-43c3-8b8f-a99691a0e6b3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:49.229000+00:00
-- started: 2026-08-03T12:25:49.302000+00:00
-- ended: 2026-08-03T12:25:51.600000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-36' AND activity_date <= DATE('2026-08-02')
