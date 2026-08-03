-- job_id: 94ac89f0-592f-49c6-b7b7-3bd349a30780
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:15.798000+00:00
-- started: 2026-08-03T12:26:15.886000+00:00
-- ended: 2026-08-03T12:26:17.707000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-40' AND activity_date <= DATE('2026-08-02')
