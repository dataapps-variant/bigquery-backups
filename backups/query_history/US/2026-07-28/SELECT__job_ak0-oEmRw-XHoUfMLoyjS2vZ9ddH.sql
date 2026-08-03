-- job_id: job_ak0-oEmRw-XHoUfMLoyjS2vZ9ddH
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:42:14.709000+00:00
-- started: 2026-07-28T12:42:14.814000+00:00
-- ended: 2026-07-28T12:42:17.598000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
