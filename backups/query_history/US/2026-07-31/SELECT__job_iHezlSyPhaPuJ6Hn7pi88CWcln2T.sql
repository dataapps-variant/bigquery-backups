-- job_id: job_iHezlSyPhaPuJ6Hn7pi88CWcln2T
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:47:00.938000+00:00
-- started: 2026-07-31T11:47:01.045000+00:00
-- ended: 2026-07-31T11:47:01.642000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
