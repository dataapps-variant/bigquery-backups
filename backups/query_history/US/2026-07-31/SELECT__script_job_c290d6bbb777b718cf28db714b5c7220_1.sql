-- job_id: script_job_c290d6bbb777b718cf28db714b5c7220_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:30:04.815000+00:00
-- started: 2026-07-31T08:30:04.901000+00:00
-- ended: 2026-07-31T08:30:05.160000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
