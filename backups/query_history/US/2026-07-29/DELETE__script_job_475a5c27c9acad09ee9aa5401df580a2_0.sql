-- job_id: script_job_475a5c27c9acad09ee9aa5401df580a2_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:30:08.927000+00:00
-- started: 2026-07-29T08:30:09.334000+00:00
-- ended: 2026-07-29T08:30:11.074000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
