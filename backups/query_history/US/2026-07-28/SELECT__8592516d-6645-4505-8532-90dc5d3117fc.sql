-- job_id: 8592516d-6645-4505-8532-90dc5d3117fc
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:51.712000+00:00
-- started: 2026-07-28T10:02:51.761000+00:00
-- ended: 2026-07-28T10:02:53.132000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-7' AND activity_date <= DATE('2026-07-27')
