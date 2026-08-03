-- job_id: c1821432-3b72-49e2-afe7-6a36e9d00cc1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:28.795000+00:00
-- started: 2026-08-03T12:27:28.837000+00:00
-- ended: 2026-08-03T12:27:30.824000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-52' AND activity_date <= DATE('2026-08-02')
