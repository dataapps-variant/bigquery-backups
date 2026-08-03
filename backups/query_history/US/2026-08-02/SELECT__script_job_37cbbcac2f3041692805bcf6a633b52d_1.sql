-- job_id: script_job_37cbbcac2f3041692805bcf6a633b52d_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.407000+00:00
-- started: 2026-08-02T08:45:03.489000+00:00
-- ended: 2026-08-02T08:45:03.760000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
