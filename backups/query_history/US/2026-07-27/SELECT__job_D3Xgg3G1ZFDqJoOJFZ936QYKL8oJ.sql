-- job_id: job_D3Xgg3G1ZFDqJoOJFZ936QYKL8oJ
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T13:43:09.842000+00:00
-- started: 2026-07-27T13:43:10.165000+00:00
-- ended: 2026-07-27T13:43:10.833000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
