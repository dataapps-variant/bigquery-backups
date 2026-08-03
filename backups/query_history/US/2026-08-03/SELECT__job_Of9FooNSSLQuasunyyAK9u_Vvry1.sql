-- job_id: job_Of9FooNSSLQuasunyyAK9u_Vvry1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:05.887000+00:00
-- started: 2026-08-03T12:29:05.976000+00:00
-- ended: 2026-08-03T12:29:09.260000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
