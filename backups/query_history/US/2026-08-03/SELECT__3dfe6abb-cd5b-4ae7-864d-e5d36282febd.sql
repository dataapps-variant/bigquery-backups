-- job_id: 3dfe6abb-cd5b-4ae7-864d-e5d36282febd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:07.901000+00:00
-- started: 2026-08-03T12:28:07.981000+00:00
-- ended: 2026-08-03T12:28:10.718000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-59' AND activity_date <= DATE('2026-08-02')
