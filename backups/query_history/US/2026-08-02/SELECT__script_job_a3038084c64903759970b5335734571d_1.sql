-- job_id: script_job_a3038084c64903759970b5335734571d_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:08.416000+00:00
-- started: 2026-08-02T08:30:08.482000+00:00
-- ended: 2026-08-02T08:30:08.715000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
)).*;
