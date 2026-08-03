-- job_id: fdcdb20a-cc89-4ad4-9af2-010aa71ba945
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:38.815000+00:00
-- started: 2026-08-03T12:23:38.904000+00:00
-- ended: 2026-08-03T12:23:41.039000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-14' AND activity_date <= DATE('2026-08-02')
