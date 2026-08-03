-- job_id: ee09b2ec-54a4-48bd-a16f-1ccb8dbcb7f3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:50.404000+00:00
-- started: 2026-08-03T12:23:50.491000+00:00
-- ended: 2026-08-03T12:23:52.483000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-15' AND activity_date <= DATE('2026-08-02')
