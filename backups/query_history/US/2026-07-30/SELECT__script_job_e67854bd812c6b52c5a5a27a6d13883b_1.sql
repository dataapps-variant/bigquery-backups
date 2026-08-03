-- job_id: script_job_e67854bd812c6b52c5a5a27a6d13883b_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:22:46.439000+00:00
-- started: 2026-07-30T10:22:46.523000+00:00
-- ended: 2026-07-30T10:22:46.751000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
)).*;
