-- job_id: script_job_d3c5ec8564656ca309f35be02748ea49_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:52:30.472000+00:00
-- started: 2026-07-30T10:52:30.540000+00:00
-- ended: 2026-07-30T10:52:30.721000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
