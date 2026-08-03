-- job_id: script_job_05d8690cd4054c9784fae347b5d5b121_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:03.518000+00:00
-- started: 2026-07-29T08:45:04.077000+00:00
-- ended: 2026-07-29T08:45:05.216000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
