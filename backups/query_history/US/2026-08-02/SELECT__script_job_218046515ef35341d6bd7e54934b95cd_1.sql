-- job_id: script_job_218046515ef35341d6bd7e54934b95cd_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.170000+00:00
-- started: 2026-08-02T08:45:03.210000+00:00
-- ended: 2026-08-02T08:45:03.426000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
)).*;
