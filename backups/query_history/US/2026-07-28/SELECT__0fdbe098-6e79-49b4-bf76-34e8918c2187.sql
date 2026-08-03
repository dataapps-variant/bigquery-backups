-- job_id: 0fdbe098-6e79-49b4-bf76-34e8918c2187
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:44.272000+00:00
-- started: 2026-07-28T10:01:44.364000+00:00
-- ended: 2026-07-28T10:01:46.152000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-20' AND activity_date <= DATE('2026-07-27')
