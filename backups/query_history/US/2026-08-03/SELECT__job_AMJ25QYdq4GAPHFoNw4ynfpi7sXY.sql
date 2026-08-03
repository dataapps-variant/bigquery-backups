-- job_id: job_AMJ25QYdq4GAPHFoNw4ynfpi7sXY
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:49:39.912000+00:00
-- started: 2026-08-03T11:49:40.030000+00:00
-- ended: 2026-08-03T11:49:40.279000+00:00

SELECT App_Name AS entity, Date AS pay_date,
          CASE WHEN LOWER(`Type `) LIKE '%credit%' THEN 'cc' ELSE LOWER(TRIM(`Type `)) END AS channel,
          SUM(SAFE_CAST(REGEXP_REPLACE(Amount, r'[$,\s]', '') AS FLOAT64)) AS amt
   FROM `variant-finance-data-project.R100.Google_Microsoft_CC_payments`
   WHERE Date IS NOT NULL AND Amount IS NOT NULL
   GROUP BY 1, 2, 3
