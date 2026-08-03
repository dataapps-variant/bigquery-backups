-- job_id: script_job_d8a56754354eb0d1ed75133ca33212a7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:16:23.340000+00:00
-- started: 2026-07-28T18:16:23.926000+00:00
-- ended: 2026-07-28T18:16:25.301000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
