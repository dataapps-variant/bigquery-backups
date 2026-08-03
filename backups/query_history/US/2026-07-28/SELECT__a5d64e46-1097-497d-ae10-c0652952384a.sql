-- job_id: a5d64e46-1097-497d-ae10-c0652952384a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:12.809000+00:00
-- started: 2026-07-28T14:31:13.105000+00:00
-- ended: 2026-07-28T14:31:15.024000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-14' AND activity_date <= DATE('2026-07-27')
