-- job_id: job_LZsea69bZyEQQhfL8sdlTz3MBkBg
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:25:19.911000+00:00
-- started: 2026-07-29T12:25:19.986000+00:00
-- ended: 2026-07-29T12:25:20.185000+00:00


  SELECT Date, ROUND(SUM(SAFE_CAST(REGEXP_REPLACE(`Amount `, r'[$,s]', '') AS FLOAT64)),2) total
  FROM `variant-finance-data-project.R100.R100_Opex` WHERE Entity='PD' GROUP BY Date ORDER BY Date
