-- job_id: script_job_6b649345a1e57af23850358db591cbb0_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:34:29.298000+00:00
-- started: 2026-07-29T09:34:29.380000+00:00
-- ended: 2026-07-29T09:34:29.582000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
