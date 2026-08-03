-- job_id: e67d9326-302c-4ade-9a9f-2d2712b4366b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:09.644000+00:00
-- started: 2026-08-03T12:24:09.747000+00:00
-- ended: 2026-08-03T12:24:12.413000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-19' AND activity_date <= DATE('2026-08-02')
