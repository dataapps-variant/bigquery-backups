-- job_id: script_job_33db6d1c4bb7ffb6d692ae01b6d7f4d8_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:30:03.011000+00:00
-- started: 2026-07-31T08:30:03.364000+00:00
-- ended: 2026-07-31T08:30:04.436000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
