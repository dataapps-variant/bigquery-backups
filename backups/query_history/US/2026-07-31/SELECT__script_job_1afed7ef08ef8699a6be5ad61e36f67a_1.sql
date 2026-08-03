-- job_id: script_job_1afed7ef08ef8699a6be5ad61e36f67a_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.427000+00:00
-- started: 2026-07-31T08:45:06.634000+00:00
-- ended: 2026-07-31T08:45:06.867000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
)).*;
