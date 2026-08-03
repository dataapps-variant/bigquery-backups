-- job_id: job_8FhV6DfHsZ4t5OJQ-vqRXmneCiiE
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T14:48:55.554000+00:00
-- started: 2026-07-27T14:48:55.654000+00:00
-- ended: 2026-07-27T14:48:56.544000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
