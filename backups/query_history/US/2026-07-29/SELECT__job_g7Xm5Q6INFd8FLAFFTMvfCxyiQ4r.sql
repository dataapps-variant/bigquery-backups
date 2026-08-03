-- job_id: job_g7Xm5Q6INFd8FLAFFTMvfCxyiQ4r
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:11:56.525000+00:00
-- started: 2026-07-29T15:11:56.618000+00:00
-- ended: 2026-07-29T15:11:57.429000+00:00

SELECT Input_ID, cohort_date, activity_date, bc_number,
          SUM(user_count) AS user_count, SUM(gross_revenue_usd) AS rev
   FROM `variant-finance-data-project.R100.R100_Historical_Main`
   GROUP BY Input_ID, cohort_date, activity_date, bc_number
