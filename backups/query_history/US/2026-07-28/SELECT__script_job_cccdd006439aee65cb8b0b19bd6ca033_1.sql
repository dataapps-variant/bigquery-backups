-- job_id: script_job_cccdd006439aee65cb8b0b19bd6ca033_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:30:03.831000+00:00
-- started: 2026-07-28T09:30:03.882000+00:00
-- ended: 2026-07-28T09:30:04.092000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
)).*;
