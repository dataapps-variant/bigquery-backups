-- job_id: 62a1e9ff-581b-4b9d-996b-e961b01ed688
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:24.854000+00:00
-- started: 2026-07-28T10:03:24.912000+00:00
-- ended: 2026-07-28T10:03:26.548000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-37' AND activity_date <= DATE('2026-07-27')
