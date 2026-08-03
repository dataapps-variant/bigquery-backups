-- job_id: e3197b80-96f8-426c-bb61-d55288e10133
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:13.028000+00:00
-- started: 2026-07-28T10:04:13.113000+00:00
-- ended: 2026-07-28T10:04:15.426000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-20' AND activity_date <= DATE('2026-07-27')
