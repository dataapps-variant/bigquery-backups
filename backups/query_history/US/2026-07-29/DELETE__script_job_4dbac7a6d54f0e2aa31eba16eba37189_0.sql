-- job_id: script_job_4dbac7a6d54f0e2aa31eba16eba37189_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:03.482000+00:00
-- started: 2026-07-29T08:45:04.092000+00:00
-- ended: 2026-07-29T08:45:06.638000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
