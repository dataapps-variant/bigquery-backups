-- job_id: script_job_b8eca4b048342c506758069eeb7696fe_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:06.995000+00:00
-- started: 2026-08-02T08:30:07.083000+00:00
-- ended: 2026-08-02T08:30:07.681000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
)).*;
