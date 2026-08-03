-- job_id: script_job_d4aadf05c8ca0ae69cc719f4cad74826_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.612000+00:00
-- started: 2026-08-02T08:45:03.668000+00:00
-- ended: 2026-08-02T08:45:03.865000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
)).*;
