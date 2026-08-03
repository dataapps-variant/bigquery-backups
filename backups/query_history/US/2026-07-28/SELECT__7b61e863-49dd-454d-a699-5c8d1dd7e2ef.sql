-- job_id: 7b61e863-49dd-454d-a699-5c8d1dd7e2ef
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:11.343000+00:00
-- started: 2026-07-28T10:02:11.416000+00:00
-- ended: 2026-07-28T10:02:13.405000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-23' AND activity_date <= DATE('2026-07-27')
