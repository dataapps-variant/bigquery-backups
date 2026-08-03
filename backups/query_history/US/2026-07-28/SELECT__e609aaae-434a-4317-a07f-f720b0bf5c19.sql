-- job_id: e609aaae-434a-4317-a07f-f720b0bf5c19
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:08.159000+00:00
-- started: 2026-07-28T14:32:08.264000+00:00
-- ended: 2026-07-28T14:32:10.316000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-22' AND activity_date <= DATE('2026-07-27')
