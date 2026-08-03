-- job_id: a98f76dd-84f6-4bf6-a317-fda39742ebaa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:34.423000+00:00
-- started: 2026-08-03T12:25:34.543000+00:00
-- ended: 2026-08-03T12:25:36.284000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-33' AND activity_date <= DATE('2026-08-02')
