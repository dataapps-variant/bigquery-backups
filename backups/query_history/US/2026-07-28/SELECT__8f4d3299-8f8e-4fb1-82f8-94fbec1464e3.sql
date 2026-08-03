-- job_id: 8f4d3299-8f8e-4fb1-82f8-94fbec1464e3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:10.905000+00:00
-- started: 2026-07-28T13:39:10.992000+00:00
-- ended: 2026-07-28T13:39:12.922000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-25' AND bc_number = 1
                GROUP BY cohort_date
