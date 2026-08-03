-- job_id: script_job_9b3160b22e2d804397b623fa89488bf2_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T14:07:31.862000+00:00
-- started: 2026-07-29T14:07:32.225000+00:00
-- ended: 2026-07-29T14:07:34.954000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
