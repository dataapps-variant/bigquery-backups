-- job_id: 2f93b928-f31a-4526-b018-220eadee8c81
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:49.460000+00:00
-- started: 2026-08-03T12:24:49.527000+00:00
-- ended: 2026-08-03T12:24:51.188000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-24' AND activity_date <= DATE('2026-08-02')
