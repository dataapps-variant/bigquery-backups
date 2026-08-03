-- job_id: fa2a22e7-29f7-4978-8eee-a8da448e835a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:46.294000+00:00
-- started: 2026-07-28T10:02:46.338000+00:00
-- ended: 2026-07-28T10:02:47.895000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-30' AND activity_date <= DATE('2026-07-27')
