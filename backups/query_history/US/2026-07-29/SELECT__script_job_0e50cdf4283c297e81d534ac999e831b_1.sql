-- job_id: script_job_0e50cdf4283c297e81d534ac999e831b_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:23:17.781000+00:00
-- started: 2026-07-29T10:23:17.853000+00:00
-- ended: 2026-07-29T10:23:18.312000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
)).*;
