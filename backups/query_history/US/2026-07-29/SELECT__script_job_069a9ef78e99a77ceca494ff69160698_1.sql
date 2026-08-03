-- job_id: script_job_069a9ef78e99a77ceca494ff69160698_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:51:36.268000+00:00
-- started: 2026-07-29T09:51:36.339000+00:00
-- ended: 2026-07-29T09:51:36.537000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
)).*;
