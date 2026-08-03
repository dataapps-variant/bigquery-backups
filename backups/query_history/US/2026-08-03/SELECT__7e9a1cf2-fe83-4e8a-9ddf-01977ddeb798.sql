-- job_id: 7e9a1cf2-fe83-4e8a-9ddf-01977ddeb798
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:24.743000+00:00
-- started: 2026-08-03T12:25:24.835000+00:00
-- ended: 2026-08-03T12:25:26.813000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-31' AND activity_date <= DATE('2026-08-02')
