-- job_id: fec24d6d-a77f-4814-a85e-b7ffbe9671c9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:06.244000+00:00
-- started: 2026-07-28T14:33:06.319000+00:00
-- ended: 2026-07-28T14:33:07.734000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-34' AND activity_date <= DATE('2026-07-27')
