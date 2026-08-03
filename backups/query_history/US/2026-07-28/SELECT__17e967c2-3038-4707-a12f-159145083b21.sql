-- job_id: 17e967c2-3038-4707-a12f-159145083b21
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:03.041000+00:00
-- started: 2026-07-28T14:30:03.119000+00:00
-- ended: 2026-07-28T14:30:04.538000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-4' AND activity_date <= DATE('2026-07-27')
