-- job_id: 9e72cd9f-a451-479d-80ad-c93f188f572a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:09.650000+00:00
-- started: 2026-08-03T12:25:09.724000+00:00
-- ended: 2026-08-03T12:25:11.951000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-28' AND activity_date <= DATE('2026-08-02')
