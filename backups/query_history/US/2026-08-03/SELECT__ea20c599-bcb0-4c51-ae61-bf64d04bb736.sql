-- job_id: ea20c599-bcb0-4c51-ae61-bf64d04bb736
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:33.414000+00:00
-- started: 2026-08-03T12:27:33.469000+00:00
-- ended: 2026-08-03T12:27:35.808000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-53' AND activity_date <= DATE('2026-08-02')
