-- job_id: script_job_63918a47314169964653dd7eee770a8c_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:15:05.288000+00:00
-- started: 2026-07-31T09:15:05.354000+00:00
-- ended: 2026-07-31T09:15:05.532000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
)).*;
