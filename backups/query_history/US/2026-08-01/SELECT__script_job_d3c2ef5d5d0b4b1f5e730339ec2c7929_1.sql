-- job_id: script_job_d3c2ef5d5d0b4b1f5e730339ec2c7929_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:05.597000+00:00
-- started: 2026-08-01T08:45:05.752000+00:00
-- ended: 2026-08-01T08:45:06.021000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
