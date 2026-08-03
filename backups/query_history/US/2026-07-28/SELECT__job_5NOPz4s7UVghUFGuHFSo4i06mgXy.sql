-- job_id: job_5NOPz4s7UVghUFGuHFSo4i06mgXy
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:17:10.388000+00:00
-- started: 2026-07-28T15:17:10.461000+00:00
-- ended: 2026-07-28T15:17:11.163000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
