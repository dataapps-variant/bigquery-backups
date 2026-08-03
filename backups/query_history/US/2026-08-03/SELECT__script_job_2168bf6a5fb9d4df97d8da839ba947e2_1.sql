-- job_id: script_job_2168bf6a5fb9d4df97d8da839ba947e2_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:03.936000+00:00
-- started: 2026-08-03T08:30:04.005000+00:00
-- ended: 2026-08-03T08:30:04.325000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
