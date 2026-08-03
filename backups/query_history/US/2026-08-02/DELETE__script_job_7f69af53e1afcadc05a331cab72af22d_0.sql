-- job_id: script_job_7f69af53e1afcadc05a331cab72af22d_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:30:03.121000+00:00
-- started: 2026-08-02T08:30:03.533000+00:00
-- ended: 2026-08-02T08:30:04.820000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
