-- job_id: script_job_4cca1ac1f3832bbf0be62e51c679d16d_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:30:08.415000+00:00
-- started: 2026-07-29T08:30:08.493000+00:00
-- ended: 2026-07-29T08:30:08.706000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
)).*;
