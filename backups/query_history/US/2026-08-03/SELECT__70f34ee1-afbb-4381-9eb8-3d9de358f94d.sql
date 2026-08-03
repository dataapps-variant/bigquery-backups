-- job_id: 70f34ee1-afbb-4381-9eb8-3d9de358f94d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:05.761000+00:00
-- started: 2026-08-03T12:23:05.823000+00:00
-- ended: 2026-08-03T12:23:08.951000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-9' AND activity_date <= DATE('2026-08-02')
