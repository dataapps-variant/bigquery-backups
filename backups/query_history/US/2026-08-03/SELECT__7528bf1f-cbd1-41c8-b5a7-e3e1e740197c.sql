-- job_id: 7528bf1f-cbd1-41c8-b5a7-e3e1e740197c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:14.693000+00:00
-- started: 2026-08-03T12:25:14.789000+00:00
-- ended: 2026-08-03T12:25:16.931000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-29' AND activity_date <= DATE('2026-08-02')
