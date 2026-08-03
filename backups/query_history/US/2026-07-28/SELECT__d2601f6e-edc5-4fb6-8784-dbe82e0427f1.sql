-- job_id: d2601f6e-edc5-4fb6-8784-dbe82e0427f1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:10.387000+00:00
-- started: 2026-07-28T10:00:10.478000+00:00
-- ended: 2026-07-28T10:00:12.510000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-6' AND activity_date <= DATE('2026-07-27')
