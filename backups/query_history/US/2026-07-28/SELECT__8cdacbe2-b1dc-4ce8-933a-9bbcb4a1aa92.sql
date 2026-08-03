-- job_id: 8cdacbe2-b1dc-4ce8-933a-9bbcb4a1aa92
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:33.757000+00:00
-- started: 2026-07-28T14:31:33.845000+00:00
-- ended: 2026-07-28T14:31:35.320000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-17' AND activity_date <= DATE('2026-07-27')
