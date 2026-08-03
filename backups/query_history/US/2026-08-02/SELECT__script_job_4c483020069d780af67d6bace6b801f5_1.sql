-- job_id: script_job_4c483020069d780af67d6bace6b801f5_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:06.323000+00:00
-- started: 2026-08-02T08:45:06.440000+00:00
-- ended: 2026-08-02T08:45:06.654000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
)).*;
