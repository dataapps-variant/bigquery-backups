-- job_id: 2359c7ac-4269-488b-9159-0ae7013b378a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:59.578000+00:00
-- started: 2026-07-28T10:04:59.641000+00:00
-- ended: 2026-07-28T10:05:01.191000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-55' AND activity_date <= DATE('2026-07-27')
