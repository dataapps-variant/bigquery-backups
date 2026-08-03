-- job_id: job_2594EYQX69pVFM6He9eQ4JCpgo97
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:36:35.349000+00:00
-- started: 2026-07-29T12:36:35.471000+00:00
-- ended: 2026-07-29T12:36:35.664000+00:00


  SELECT Entity AS entity, Date AS d,
         SUM(COALESCE(SAFE_CAST(REGEXP_REPLACE(`Amount `, r'[$,s]', '') AS FLOAT64), 0)) AS amt
  FROM `variant-finance-data-project.R100.R100_Opex`
  WHERE Date IS NOT NULL AND Entity IS NOT NULL
  GROUP BY 1, 2
