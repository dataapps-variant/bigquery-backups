-- job_id: e55814ee-ae6f-4422-be86-261c87982308
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:29.759000+00:00
-- started: 2026-07-28T14:31:29.865000+00:00
-- ended: 2026-07-28T14:31:31.483000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-16' AND activity_date <= DATE('2026-07-27')
