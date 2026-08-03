-- job_id: script_job_30c3e1dce4eccfaddcfce920a5f46048_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:04.271000+00:00
-- started: 2026-07-28T08:45:04.315000+00:00
-- ended: 2026-07-28T08:45:04.497000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
)).*;
