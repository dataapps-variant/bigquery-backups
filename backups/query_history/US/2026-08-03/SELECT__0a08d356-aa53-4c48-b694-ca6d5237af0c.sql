-- job_id: 0a08d356-aa53-4c48-b694-ca6d5237af0c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:24.119000+00:00
-- started: 2026-08-03T12:26:24.170000+00:00
-- ended: 2026-08-03T12:26:26.219000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-42' AND activity_date <= DATE('2026-08-02')
