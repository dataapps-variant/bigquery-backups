-- job_id: d1cbe1bb-4382-46c6-b7f0-a8dfc8ae09f8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:39.347000+00:00
-- started: 2026-07-28T10:01:39.511000+00:00
-- ended: 2026-07-28T10:01:41.171000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-19' AND activity_date <= DATE('2026-07-27')
