-- job_id: 59326350-7fab-4d19-a154-968fae248e9a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:37.229000+00:00
-- started: 2026-07-28T10:02:37.315000+00:00
-- ended: 2026-07-28T10:02:38.883000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-4' AND activity_date <= DATE('2026-07-27')
