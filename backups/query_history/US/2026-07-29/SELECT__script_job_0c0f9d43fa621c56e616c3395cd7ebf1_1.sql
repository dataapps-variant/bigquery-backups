-- job_id: script_job_0c0f9d43fa621c56e616c3395cd7ebf1_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:06.686000+00:00
-- started: 2026-07-29T08:45:06.753000+00:00
-- ended: 2026-07-29T08:45:06.949000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
)).*;
