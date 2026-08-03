-- job_id: 57498767-89ec-4c9b-bd83-f71b4c7cd562
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:55.202000+00:00
-- started: 2026-07-28T10:01:55.287000+00:00
-- ended: 2026-07-28T10:01:57.780000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-21' AND activity_date <= DATE('2026-07-27')
