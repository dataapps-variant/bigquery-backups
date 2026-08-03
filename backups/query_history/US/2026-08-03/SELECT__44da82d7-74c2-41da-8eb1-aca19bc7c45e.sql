-- job_id: 44da82d7-74c2-41da-8eb1-aca19bc7c45e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:24.449000+00:00
-- started: 2026-08-03T12:27:24.508000+00:00
-- ended: 2026-08-03T12:27:26.370000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-51' AND activity_date <= DATE('2026-08-02')
