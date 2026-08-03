-- job_id: f76cc40e-05c2-488b-90e0-caaa5f102874
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:21:58.624000+00:00
-- started: 2026-08-03T12:21:58.730000+00:00
-- ended: 2026-08-03T12:22:01.852000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-1' AND activity_date <= DATE('2026-08-02')
