-- job_id: script_job_20ba1793174a6abf4561eaf6028cdf47_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:30:10.611000+00:00
-- started: 2026-07-29T08:30:10.669000+00:00
-- ended: 2026-07-29T08:30:11.085000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
