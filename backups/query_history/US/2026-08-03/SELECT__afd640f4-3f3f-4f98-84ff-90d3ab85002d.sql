-- job_id: afd640f4-3f3f-4f98-84ff-90d3ab85002d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:29.571000+00:00
-- started: 2026-08-03T12:26:29.674000+00:00
-- ended: 2026-08-03T12:26:31.886000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-43' AND activity_date <= DATE('2026-08-02')
