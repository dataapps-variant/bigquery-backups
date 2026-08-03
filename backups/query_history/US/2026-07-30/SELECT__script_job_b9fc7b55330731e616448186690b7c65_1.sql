-- job_id: script_job_b9fc7b55330731e616448186690b7c65_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:55:12.850000+00:00
-- started: 2026-07-30T10:55:12.906000+00:00
-- ended: 2026-07-30T10:55:13.132000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
