-- job_id: job_oLX02ffi6Q3017xikDJ3aPmhf8j5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:14:02.127000+00:00
-- started: 2026-07-28T13:14:02.224000+00:00
-- ended: 2026-07-28T13:14:02.358000+00:00

SELECT App_Name AS entity, Date AS pay_date,
          CASE WHEN LOWER(`Type `) LIKE '%credit%' THEN 'cc' ELSE LOWER(TRIM(`Type `)) END AS channel,
          SUM(SAFE_CAST(REGEXP_REPLACE(Amount, r'[$,\s]', '') AS FLOAT64)) AS amt
   FROM `variant-finance-data-project.R100.Google_Microsoft_CC_payments`
   WHERE Date IS NOT NULL AND Amount IS NOT NULL
   GROUP BY 1, 2, 3
