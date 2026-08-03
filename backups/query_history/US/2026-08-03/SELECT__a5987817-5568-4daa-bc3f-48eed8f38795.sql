-- job_id: a5987817-5568-4daa-bc3f-48eed8f38795
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:00.620000+00:00
-- started: 2026-08-03T12:24:00.720000+00:00
-- ended: 2026-08-03T12:24:02.748000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-17' AND activity_date <= DATE('2026-08-02')
