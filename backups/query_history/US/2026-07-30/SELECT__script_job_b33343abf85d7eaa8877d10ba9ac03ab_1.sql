-- job_id: script_job_b33343abf85d7eaa8877d10ba9ac03ab_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:41:32.750000+00:00
-- started: 2026-07-30T10:41:32.837000+00:00
-- ended: 2026-07-30T10:41:33.052000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
