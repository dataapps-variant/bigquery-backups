-- job_id: script_job_ec140c262cc2b11b0ce84b0450df9ee2_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:31:26.048000+00:00
-- started: 2026-07-29T10:31:26.094000+00:00
-- ended: 2026-07-29T10:31:26.327000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
