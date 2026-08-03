-- job_id: script_job_7e91be1c7b6c8cd600333e02a23311a2_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:07.442000+00:00
-- started: 2026-07-28T08:30:07.479000+00:00
-- ended: 2026-07-28T08:30:07.703000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
