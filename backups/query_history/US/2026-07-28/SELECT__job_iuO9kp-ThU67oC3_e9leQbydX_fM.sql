-- job_id: job_iuO9kp-ThU67oC3_e9leQbydX_fM
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:10:33.755000+00:00
-- started: 2026-07-28T15:10:33.831000+00:00
-- ended: 2026-07-28T15:10:34.572000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
