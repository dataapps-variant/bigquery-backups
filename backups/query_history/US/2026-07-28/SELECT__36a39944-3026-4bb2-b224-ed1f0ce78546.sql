-- job_id: 36a39944-3026-4bb2-b224-ed1f0ce78546
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:51.619000+00:00
-- started: 2026-07-28T10:04:51.668000+00:00
-- ended: 2026-07-28T10:04:53.148000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-53' AND activity_date <= DATE('2026-07-27')
