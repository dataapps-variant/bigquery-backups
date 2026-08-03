-- job_id: ec1d77b1-c399-4a21-adbf-23fdb28613fb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:39.852000+00:00
-- started: 2026-07-28T10:00:39.933000+00:00
-- ended: 2026-07-28T10:00:41.954000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-9' AND activity_date <= DATE('2026-07-27')
