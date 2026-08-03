-- job_id: a8fd1a96-8484-40d1-bacc-12bfd60476f4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:56.400000+00:00
-- started: 2026-07-28T14:32:56.475000+00:00
-- ended: 2026-07-28T14:32:57.896000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-32' AND activity_date <= DATE('2026-07-27')
