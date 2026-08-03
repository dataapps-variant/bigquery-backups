-- job_id: 216fe80b-22b6-464b-80f2-f693e4137b74
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:49.320000+00:00
-- started: 2026-08-03T12:27:49.381000+00:00
-- ended: 2026-08-03T12:27:51.203000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-56' AND activity_date <= DATE('2026-08-02')
