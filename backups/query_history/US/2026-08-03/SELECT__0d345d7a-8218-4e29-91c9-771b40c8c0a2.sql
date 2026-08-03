-- job_id: 0d345d7a-8218-4e29-91c9-771b40c8c0a2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:18.295000+00:00
-- started: 2026-08-03T12:23:18.346000+00:00
-- ended: 2026-08-03T12:23:20.432000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-11' AND activity_date <= DATE('2026-08-02')
