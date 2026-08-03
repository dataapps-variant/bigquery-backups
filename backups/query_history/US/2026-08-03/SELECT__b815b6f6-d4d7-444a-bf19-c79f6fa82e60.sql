-- job_id: b815b6f6-d4d7-444a-bf19-c79f6fa82e60
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:20.262000+00:00
-- started: 2026-08-03T12:26:20.315000+00:00
-- ended: 2026-08-03T12:26:21.942000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-41' AND activity_date <= DATE('2026-08-02')
