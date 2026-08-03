-- job_id: 9edddccd-83c1-4534-b406-dec383baf861
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:58.636000+00:00
-- started: 2026-07-28T14:29:58.747000+00:00
-- ended: 2026-07-28T14:30:00.199000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-3' AND activity_date <= DATE('2026-07-27')
