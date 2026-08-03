-- job_id: job_7NwS9j3L7Ldp2ndEw4GVp8ehw4PB
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:26:01.271000+00:00
-- started: 2026-07-29T12:26:01.361000+00:00
-- ended: 2026-07-29T12:26:01.569000+00:00

SELECT Entity, COUNT(*) rows_in_window, ROUND(SUM(SAFE_CAST(REGEXP_REPLACE(`Amount `, r'[$,s]', '') AS FLOAT64)),2) total
  FROM `variant-finance-data-project.R100.R100_Opex` WHERE Date BETWEEN '2026-07-28' AND '2026-11-05' GROUP BY 1 ORDER BY 1
