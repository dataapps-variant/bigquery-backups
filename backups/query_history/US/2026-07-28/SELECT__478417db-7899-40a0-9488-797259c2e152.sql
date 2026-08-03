-- job_id: 478417db-7899-40a0-9488-797259c2e152
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:34.732000+00:00
-- started: 2026-07-28T14:34:34.827000+00:00
-- ended: 2026-07-28T14:34:36.175000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-49' AND activity_date <= DATE('2026-07-27')
