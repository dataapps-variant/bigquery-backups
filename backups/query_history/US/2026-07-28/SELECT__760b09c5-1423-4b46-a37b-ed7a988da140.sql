-- job_id: 760b09c5-1423-4b46-a37b-ed7a988da140
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:19.241000+00:00
-- started: 2026-07-28T10:06:19.339000+00:00
-- ended: 2026-07-28T10:06:20.235000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-48' AND activity_date <= DATE('2026-07-27')
