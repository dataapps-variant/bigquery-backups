-- job_id: script_job_3fb8d1ec4a04a43c04f36165a65edbcd_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T16:31:47.937000+00:00
-- started: 2026-07-28T16:31:47.994000+00:00
-- ended: 2026-07-28T16:31:48.214000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
