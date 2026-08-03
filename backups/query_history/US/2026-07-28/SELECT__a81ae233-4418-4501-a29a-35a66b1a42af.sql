-- job_id: a81ae233-4418-4501-a29a-35a66b1a42af
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:23.119000+00:00
-- started: 2026-07-28T14:32:23.201000+00:00
-- ended: 2026-07-28T14:32:24.559000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-25' AND activity_date <= DATE('2026-07-27')
