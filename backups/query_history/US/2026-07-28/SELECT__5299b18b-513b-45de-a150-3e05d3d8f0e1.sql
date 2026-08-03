-- job_id: 5299b18b-513b-45de-a150-3e05d3d8f0e1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:06.342000+00:00
-- started: 2026-07-28T10:02:06.433000+00:00
-- ended: 2026-07-28T10:02:08.685000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-22' AND activity_date <= DATE('2026-07-27')
