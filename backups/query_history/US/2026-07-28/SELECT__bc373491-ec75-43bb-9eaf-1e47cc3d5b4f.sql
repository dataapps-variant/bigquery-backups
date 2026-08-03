-- job_id: bc373491-ec75-43bb-9eaf-1e47cc3d5b4f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:59.577000+00:00
-- started: 2026-07-28T10:04:59.640000+00:00
-- ended: 2026-07-28T10:05:00.252000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-30' AND activity_date <= DATE('2026-07-27')
