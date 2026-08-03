-- job_id: 6b1a20e2-56b2-44a2-9ab3-208ba67cb263
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:52.961000+00:00
-- started: 2026-08-03T12:26:53.040000+00:00
-- ended: 2026-08-03T12:26:54.729000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-44' AND activity_date <= DATE('2026-08-02')
