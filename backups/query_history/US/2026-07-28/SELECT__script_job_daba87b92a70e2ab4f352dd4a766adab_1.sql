-- job_id: script_job_daba87b92a70e2ab4f352dd4a766adab_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T15:10:19.522000+00:00
-- started: 2026-07-28T15:10:19.625000+00:00
-- ended: 2026-07-28T15:10:22.517000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
