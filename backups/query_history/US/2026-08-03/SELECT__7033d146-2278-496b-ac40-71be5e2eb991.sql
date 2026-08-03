-- job_id: 7033d146-2278-496b-ac40-71be5e2eb991
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:44.338000+00:00
-- started: 2026-08-03T12:25:44.422000+00:00
-- ended: 2026-08-03T12:25:46.306000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-35' AND activity_date <= DATE('2026-08-02')
