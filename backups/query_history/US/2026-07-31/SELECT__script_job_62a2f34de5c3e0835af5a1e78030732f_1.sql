-- job_id: script_job_62a2f34de5c3e0835af5a1e78030732f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:30:07.515000+00:00
-- started: 2026-07-31T09:30:07.611000+00:00
-- ended: 2026-07-31T09:30:07.817000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
)).*;
