-- job_id: 81e01e01-f628-49a5-9f0a-34743c4c94bb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:58.117000+00:00
-- started: 2026-07-28T14:31:58.203000+00:00
-- ended: 2026-07-28T14:32:00.098000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-21' AND activity_date <= DATE('2026-07-27')
