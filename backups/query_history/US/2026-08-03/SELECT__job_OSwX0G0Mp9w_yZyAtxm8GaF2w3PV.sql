-- job_id: job_OSwX0G0Mp9w_yZyAtxm8GaF2w3PV
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:32:02.803000+00:00
-- started: 2026-08-03T12:32:02.904000+00:00
-- ended: 2026-08-03T12:32:03.047000+00:00

SELECT Entity AS entity, Date AS d,
          SUM(COALESCE(SAFE_CAST(REGEXP_REPLACE(`Amount `, r'[$,\s]', '') AS FLOAT64), 0)) AS amt
   FROM `variant-finance-data-project.R100.R100_Opex`
   WHERE Date IS NOT NULL AND Entity IS NOT NULL
   GROUP BY 1, 2
