-- job_id: script_job_5178a07c0475ada45c224e9abb2e034f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.453000+00:00
-- started: 2026-08-02T08:45:03.525000+00:00
-- ended: 2026-08-02T08:45:03.736000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table`
)).*;
