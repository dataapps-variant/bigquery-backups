-- job_id: a5a5debd-2139-47c6-a989-3e1e93b1d470
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:04.989000+00:00
-- started: 2026-08-03T12:24:05.076000+00:00
-- ended: 2026-08-03T12:24:06.910000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-18' AND activity_date <= DATE('2026-08-02')
