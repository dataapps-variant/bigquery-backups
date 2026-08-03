-- job_id: d75ba40a-4800-4131-9914-7f5cdff338f4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:59.276000+00:00
-- started: 2026-07-28T10:00:59.350000+00:00
-- ended: 2026-07-28T10:01:00.693000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-12' AND activity_date <= DATE('2026-07-27')
