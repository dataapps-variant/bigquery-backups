-- job_id: script_job_2de65d33ccf9ac7b08dd9eef1d2e96c5_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:45:05.883000+00:00
-- started: 2026-07-29T09:45:05.997000+00:00
-- ended: 2026-07-29T09:45:06.217000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
)).*;
