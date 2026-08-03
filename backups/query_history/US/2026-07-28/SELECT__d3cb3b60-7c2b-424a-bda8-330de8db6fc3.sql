-- job_id: d3cb3b60-7c2b-424a-bda8-330de8db6fc3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:27.364000+00:00
-- started: 2026-07-28T14:34:27.446000+00:00
-- ended: 2026-07-28T14:34:28.688000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-47' AND activity_date <= DATE('2026-07-27')
