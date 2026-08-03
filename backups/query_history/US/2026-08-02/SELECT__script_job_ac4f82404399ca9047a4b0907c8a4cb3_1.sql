-- job_id: script_job_ac4f82404399ca9047a4b0907c8a4cb3_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:30:10.176000+00:00
-- started: 2026-08-02T09:30:10.256000+00:00
-- ended: 2026-08-02T09:30:10.480000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
)).*;
