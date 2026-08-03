-- job_id: 86b04864-d7e0-4688-8556-9aff599b3e1f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:07.591000+00:00
-- started: 2026-07-28T14:30:07.671000+00:00
-- ended: 2026-07-28T14:30:09.292000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-5' AND activity_date <= DATE('2026-07-27')
