-- job_id: script_job_898121ae5310080b9dee836fdb340ca3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:34:16.359000+00:00
-- started: 2026-07-28T18:34:16.746000+00:00
-- ended: 2026-07-28T18:34:18.831000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
