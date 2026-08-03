-- job_id: job_6S8sSCLte8aTgU1uP9qMoG0e0xu2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:49:40.762000+00:00
-- started: 2026-08-03T11:49:40.999000+00:00
-- ended: 2026-08-03T11:49:41.191000+00:00

SELECT Entity AS entity, Date AS d,
          SUM(COALESCE(SAFE_CAST(REGEXP_REPLACE(`Amount `, r'[$,\s]', '') AS FLOAT64), 0)) AS amt
   FROM `variant-finance-data-project.R100.R100_Opex`
   WHERE Date IS NOT NULL AND Entity IS NOT NULL
   GROUP BY 1, 2
