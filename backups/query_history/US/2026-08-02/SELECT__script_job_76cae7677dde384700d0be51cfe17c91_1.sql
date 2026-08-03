-- job_id: script_job_76cae7677dde384700d0be51cfe17c91_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:07.752000+00:00
-- started: 2026-08-02T08:45:07.822000+00:00
-- ended: 2026-08-02T08:45:07.991000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
