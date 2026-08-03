-- job_id: script_job_dc82120a75b77831d79f909918824d68_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:02.728000+00:00
-- started: 2026-07-28T08:45:03.174000+00:00
-- ended: 2026-07-28T08:45:04.360000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
