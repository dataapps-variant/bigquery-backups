-- job_id: e43679b3-ad25-4247-8104-68f60ddae30e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:15.566000+00:00
-- started: 2026-08-03T12:27:15.664000+00:00
-- ended: 2026-08-03T12:27:17.386000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-49' AND activity_date <= DATE('2026-08-02')
