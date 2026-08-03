-- job_id: d8a20dee-e071-4d28-902d-0f5d87a6c9f2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:19.941000+00:00
-- started: 2026-08-03T12:25:20.007000+00:00
-- ended: 2026-08-03T12:25:22+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-30' AND activity_date <= DATE('2026-08-02')
