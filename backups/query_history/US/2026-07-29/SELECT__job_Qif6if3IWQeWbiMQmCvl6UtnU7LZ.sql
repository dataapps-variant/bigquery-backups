-- job_id: job_Qif6if3IWQeWbiMQmCvl6UtnU7LZ
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:26:00.469000+00:00
-- started: 2026-07-29T12:26:00.577000+00:00
-- ended: 2026-07-29T12:26:00.800000+00:00

SELECT Category, `Amount ` raw, COUNT(*) n FROM `variant-finance-data-project.R100.R100_Opex`
  WHERE SAFE_CAST(REGEXP_REPLACE(`Amount `, r'[$,s]', '') AS FLOAT64) IS NULL GROUP BY 1,2 ORDER BY n DESC LIMIT 5
