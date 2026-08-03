-- job_id: 3b5bd8aa-5354-4c7b-98f7-48dcccdd12de
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:40.246000+00:00
-- started: 2026-07-28T10:06:40.318000+00:00
-- ended: 2026-07-28T10:06:40.957000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-56' AND activity_date <= DATE('2026-07-27')
