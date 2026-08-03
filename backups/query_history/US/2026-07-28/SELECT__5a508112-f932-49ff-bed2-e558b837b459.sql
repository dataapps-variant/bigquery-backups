-- job_id: 5a508112-f932-49ff-bed2-e558b837b459
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:33.170000+00:00
-- started: 2026-07-28T10:03:33.247000+00:00
-- ended: 2026-07-28T10:03:34.871000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-39' AND activity_date <= DATE('2026-07-27')
