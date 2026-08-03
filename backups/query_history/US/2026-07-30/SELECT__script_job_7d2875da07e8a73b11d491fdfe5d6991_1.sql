-- job_id: script_job_7d2875da07e8a73b11d491fdfe5d6991_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:07.018000+00:00
-- started: 2026-07-30T08:30:07.270000+00:00
-- ended: 2026-07-30T08:30:07.646000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
