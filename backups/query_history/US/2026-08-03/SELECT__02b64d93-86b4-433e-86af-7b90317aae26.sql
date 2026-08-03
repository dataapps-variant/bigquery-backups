-- job_id: 02b64d93-86b4-433e-86af-7b90317aae26
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:55.709000+00:00
-- started: 2026-08-03T12:23:55.760000+00:00
-- ended: 2026-08-03T12:23:57.853000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-16' AND activity_date <= DATE('2026-08-02')
