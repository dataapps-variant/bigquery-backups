-- job_id: job_eO0p9h5a3VZeDRtALG3OPlcl6Sid
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:43:27.682000+00:00
-- started: 2026-07-28T13:43:27.797000+00:00
-- ended: 2026-07-28T13:43:29.032000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
