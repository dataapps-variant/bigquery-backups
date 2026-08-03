-- job_id: fa48567f-bbc0-41b4-ab59-8fe5274c1db8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:09.545000+00:00
-- started: 2026-07-28T10:05:09.607000+00:00
-- ended: 2026-07-28T10:05:10.920000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-57' AND activity_date <= DATE('2026-07-27')
