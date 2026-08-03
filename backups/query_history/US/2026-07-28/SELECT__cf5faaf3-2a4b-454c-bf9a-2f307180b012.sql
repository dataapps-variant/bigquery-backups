-- job_id: cf5faaf3-2a4b-454c-bf9a-2f307180b012
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:36.314000+00:00
-- started: 2026-07-28T10:04:36.383000+00:00
-- ended: 2026-07-28T10:04:37.736000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-49' AND activity_date <= DATE('2026-07-27')
