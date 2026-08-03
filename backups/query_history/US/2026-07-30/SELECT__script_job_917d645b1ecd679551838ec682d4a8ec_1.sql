-- job_id: script_job_917d645b1ecd679551838ec682d4a8ec_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.311000+00:00
-- started: 2026-07-30T08:45:07.393000+00:00
-- ended: 2026-07-30T08:45:07.583000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
)).*;
