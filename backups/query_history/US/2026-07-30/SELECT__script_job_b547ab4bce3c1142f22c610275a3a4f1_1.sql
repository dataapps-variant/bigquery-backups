-- job_id: script_job_b547ab4bce3c1142f22c610275a3a4f1_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:06.205000+00:00
-- started: 2026-07-30T08:45:06.288000+00:00
-- ended: 2026-07-30T08:45:06.488000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
)).*;
