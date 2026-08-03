-- job_id: job_BZ7YhDA6ksjj4EWK9Th8ROMkQ-xE
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:11:02.646000+00:00
-- started: 2026-07-28T13:11:02.731000+00:00
-- ended: 2026-07-28T13:11:03.556000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
