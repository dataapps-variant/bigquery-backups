-- job_id: 3c2b7b6a-bf46-4203-a54d-7471bd51222f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:39.029000+00:00
-- started: 2026-08-03T12:24:39.114000+00:00
-- ended: 2026-08-03T12:24:40.808000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-22' AND activity_date <= DATE('2026-08-02')
