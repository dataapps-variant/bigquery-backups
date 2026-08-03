-- job_id: 3de769b4-803d-44bc-aace-bf60495b76da
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:15.104000+00:00
-- started: 2026-08-03T12:24:15.194000+00:00
-- ended: 2026-08-03T12:24:17.802000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-20' AND activity_date <= DATE('2026-08-02')
