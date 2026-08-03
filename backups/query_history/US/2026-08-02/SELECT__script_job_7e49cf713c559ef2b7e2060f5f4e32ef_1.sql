-- job_id: script_job_7e49cf713c559ef2b7e2060f5f4e32ef_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.407000+00:00
-- started: 2026-08-02T08:45:03.496000+00:00
-- ended: 2026-08-02T08:45:03.853000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
)).*;
