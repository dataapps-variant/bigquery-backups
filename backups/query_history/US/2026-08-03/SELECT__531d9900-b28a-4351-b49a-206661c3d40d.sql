-- job_id: 531d9900-b28a-4351-b49a-206661c3d40d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:44.156000+00:00
-- started: 2026-08-03T12:27:44.253000+00:00
-- ended: 2026-08-03T12:27:46.724000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-55' AND activity_date <= DATE('2026-08-02')
