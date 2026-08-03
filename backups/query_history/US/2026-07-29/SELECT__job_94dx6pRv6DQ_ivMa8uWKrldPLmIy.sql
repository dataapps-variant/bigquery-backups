-- job_id: job_94dx6pRv6DQ_ivMa8uWKrldPLmIy
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:25:20.721000+00:00
-- started: 2026-07-29T12:25:20.858000+00:00
-- ended: 2026-07-29T12:25:21.058000+00:00


  SELECT COUNT(*) total_rows,
    COUNTIF(SAFE_CAST(REGEXP_REPLACE(`Amount `, r'[$,s]', '') AS FLOAT64) IS NULL) unparseable
  FROM `variant-finance-data-project.R100.R100_Opex`
