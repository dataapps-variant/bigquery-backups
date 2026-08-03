-- job_id: job_OAxIUJcydYSfNjl0PpyaEXG_aXk5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:42:10.835000+00:00
-- started: 2026-07-31T11:42:10.926000+00:00
-- ended: 2026-07-31T11:42:11.032000+00:00

SELECT Entity AS entity, Date AS d,
          SUM(COALESCE(SAFE_CAST(REGEXP_REPLACE(`Amount `, r'[$,\s]', '') AS FLOAT64), 0)) AS amt
   FROM `variant-finance-data-project.R100.R100_Opex`
   WHERE Date IS NOT NULL AND Entity IS NOT NULL
   GROUP BY 1, 2
