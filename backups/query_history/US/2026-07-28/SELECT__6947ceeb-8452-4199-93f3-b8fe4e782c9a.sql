-- job_id: 6947ceeb-8452-4199-93f3-b8fe4e782c9a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:08.961000+00:00
-- started: 2026-07-28T10:01:09.061000+00:00
-- ended: 2026-07-28T10:01:11.328000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-14' AND activity_date <= DATE('2026-07-27')
