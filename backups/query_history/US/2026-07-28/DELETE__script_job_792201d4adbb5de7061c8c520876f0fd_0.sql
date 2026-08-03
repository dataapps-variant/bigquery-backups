-- job_id: script_job_792201d4adbb5de7061c8c520876f0fd_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:45:03.963000+00:00
-- started: 2026-07-28T18:45:04.340000+00:00
-- ended: 2026-07-28T18:45:06.843000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
