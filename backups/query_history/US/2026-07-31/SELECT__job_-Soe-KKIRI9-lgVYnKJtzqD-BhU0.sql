-- job_id: job_-Soe-KKIRI9-lgVYnKJtzqD-BhU0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:34:25.611000+00:00
-- started: 2026-07-31T11:34:25.713000+00:00
-- ended: 2026-07-31T11:34:26.248000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
