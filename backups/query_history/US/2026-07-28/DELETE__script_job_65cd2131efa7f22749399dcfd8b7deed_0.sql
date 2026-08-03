-- job_id: script_job_65cd2131efa7f22749399dcfd8b7deed_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:03.657000+00:00
-- started: 2026-07-28T08:45:03.977000+00:00
-- ended: 2026-07-28T08:45:04.997000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
