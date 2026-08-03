-- job_id: 7ab2d868-04e9-49b9-9b5d-825a6ab3f1fa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:51.254000+00:00
-- started: 2026-07-28T10:00:51.343000+00:00
-- ended: 2026-07-28T10:00:53.189000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-11' AND activity_date <= DATE('2026-07-27')
