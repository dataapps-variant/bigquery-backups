-- job_id: 7d5963da-e33a-463a-ab3c-e3b18fce86d9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:33.703000+00:00
-- started: 2026-08-03T12:23:33.788000+00:00
-- ended: 2026-08-03T12:23:36.052000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-13' AND activity_date <= DATE('2026-08-02')
