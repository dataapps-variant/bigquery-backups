-- job_id: 4a0b4f29-a473-4807-9d4d-440a0dd0ef21
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:19.627000+00:00
-- started: 2026-08-03T12:27:19.722000+00:00
-- ended: 2026-08-03T12:27:21.862000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-50' AND activity_date <= DATE('2026-08-02')
