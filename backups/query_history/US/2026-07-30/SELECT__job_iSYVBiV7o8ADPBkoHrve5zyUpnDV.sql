-- job_id: job_iSYVBiV7o8ADPBkoHrve5zyUpnDV
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:59.876000+00:00
-- started: 2026-07-30T16:11:59.986000+00:00
-- ended: 2026-07-30T16:12:00.707000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
