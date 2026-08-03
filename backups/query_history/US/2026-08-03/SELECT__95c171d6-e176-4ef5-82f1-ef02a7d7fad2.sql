-- job_id: 95c171d6-e176-4ef5-82f1-ef02a7d7fad2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:28.249000+00:00
-- started: 2026-08-03T12:24:28.329000+00:00
-- ended: 2026-08-03T12:24:31.144000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-21' AND activity_date <= DATE('2026-08-02')
