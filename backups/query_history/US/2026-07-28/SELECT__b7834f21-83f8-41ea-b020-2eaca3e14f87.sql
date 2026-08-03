-- job_id: b7834f21-83f8-41ea-b020-2eaca3e14f87
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:53.922000+00:00
-- started: 2026-07-28T10:04:53.990000+00:00
-- ended: 2026-07-28T10:04:54.868000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-28' AND activity_date <= DATE('2026-07-27')
