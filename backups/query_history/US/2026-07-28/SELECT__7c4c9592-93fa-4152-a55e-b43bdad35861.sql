-- job_id: 7c4c9592-93fa-4152-a55e-b43bdad35861
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:31.880000+00:00
-- started: 2026-07-28T10:04:31.945000+00:00
-- ended: 2026-07-28T10:04:33.800000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-48' AND activity_date <= DATE('2026-07-27')
