-- job_id: script_job_559e664d57b7e05cde1e1b1bdb2a779d_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:11.751000+00:00
-- started: 2026-08-01T08:30:11.827000+00:00
-- ended: 2026-08-01T08:30:13.992000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
