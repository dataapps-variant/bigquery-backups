-- job_id: script_job_06cfd78c80359f21b2bce9e8e483a769_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:15:05.161000+00:00
-- started: 2026-08-02T09:15:05.237000+00:00
-- ended: 2026-08-02T09:15:05.429000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
)).*;
