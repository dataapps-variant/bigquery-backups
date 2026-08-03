-- job_id: script_job_9567c52dc1ddbce58e94179d2e3da5f5_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:11:12.961000+00:00
-- started: 2026-07-30T10:11:13.039000+00:00
-- ended: 2026-07-30T10:11:13.321000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
)).*;
