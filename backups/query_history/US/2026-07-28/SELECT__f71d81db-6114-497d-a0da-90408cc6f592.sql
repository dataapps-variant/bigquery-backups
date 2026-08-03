-- job_id: f71d81db-6114-497d-a0da-90408cc6f592
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:34.820000+00:00
-- started: 2026-07-28T10:06:34.900000+00:00
-- ended: 2026-07-28T10:06:35.624000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-54' AND activity_date <= DATE('2026-07-27')
