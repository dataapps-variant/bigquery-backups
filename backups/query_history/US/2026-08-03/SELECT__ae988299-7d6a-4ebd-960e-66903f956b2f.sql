-- job_id: ae988299-7d6a-4ebd-960e-66903f956b2f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:24.967000+00:00
-- started: 2026-08-03T12:22:25.044000+00:00
-- ended: 2026-08-03T12:22:26.892000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-4' AND activity_date <= DATE('2026-08-02')
