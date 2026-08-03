-- job_id: job_cYyvkyWIj7mbT5fWbNkgx2ZXrV_1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:25:59.722000+00:00
-- started: 2026-07-29T12:25:59.824000+00:00
-- ended: 2026-07-29T12:25:59.995000+00:00

SELECT EXTRACT(DAY FROM Date) day, Category, ROUND(SAFE_CAST(REGEXP_REPLACE(`Amount `, r'[$,s]', '') AS FLOAT64),2) amount
  FROM `variant-finance-data-project.R100.R100_Opex` WHERE Entity='PD' AND Date BETWEEN '2026-08-01' AND '2026-08-31' ORDER BY day
