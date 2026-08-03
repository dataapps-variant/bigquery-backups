-- job_id: a5ff7ad2-fc28-451c-9489-1790887e8be9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:55.317000+00:00
-- started: 2026-07-28T10:04:55.371000+00:00
-- ended: 2026-07-28T10:04:56.917000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-54' AND activity_date <= DATE('2026-07-27')
