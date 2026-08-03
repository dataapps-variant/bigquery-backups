-- job_id: e6777abd-3746-4f8f-9fdc-9c2b7b8a59c9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:14.232000+00:00
-- started: 2026-08-03T12:22:14.348000+00:00
-- ended: 2026-08-03T12:22:16.261000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-2' AND activity_date <= DATE('2026-08-02')
