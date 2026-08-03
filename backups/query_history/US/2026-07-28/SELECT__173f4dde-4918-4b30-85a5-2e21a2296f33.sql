-- job_id: 173f4dde-4918-4b30-85a5-2e21a2296f33
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:13.327000+00:00
-- started: 2026-07-28T14:32:13.409000+00:00
-- ended: 2026-07-28T14:32:15.076000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-23' AND activity_date <= DATE('2026-07-27')
