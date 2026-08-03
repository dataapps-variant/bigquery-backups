-- job_id: script_job_907014489aa8943a8556c90c8c303f1e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:30:05.725000+00:00
-- started: 2026-08-02T09:30:05.790000+00:00
-- ended: 2026-08-02T09:30:05.987000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
)).*;
