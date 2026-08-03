-- job_id: script_job_6bf1f8e873c5a211f602a7360345c592_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:45:04.976000+00:00
-- started: 2026-08-02T09:45:05.080000+00:00
-- ended: 2026-08-02T09:45:05.337000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
)).*;
