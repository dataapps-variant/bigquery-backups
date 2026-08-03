-- job_id: script_job_ab185ca97bc4d6a7a6de6dea097d2f07_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:50:26.907000+00:00
-- started: 2026-07-28T18:50:27.285000+00:00
-- ended: 2026-07-28T18:50:29.208000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
