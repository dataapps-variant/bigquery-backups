-- job_id: bce132f2-ffbf-446f-b4a7-a96ee8ca7297
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:20.491000+00:00
-- started: 2026-08-03T12:22:20.599000+00:00
-- ended: 2026-08-03T12:22:22.517000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-3' AND activity_date <= DATE('2026-08-02')
