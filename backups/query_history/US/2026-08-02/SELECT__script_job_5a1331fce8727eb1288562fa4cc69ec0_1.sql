-- job_id: script_job_5a1331fce8727eb1288562fa4cc69ec0_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:07.989000+00:00
-- started: 2026-08-02T08:30:08.091000+00:00
-- ended: 2026-08-02T08:30:08.665000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
)).*;
