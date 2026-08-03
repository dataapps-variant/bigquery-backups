-- job_id: script_job_c30350a1425715f6aea58327ad62e934_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T14:05:19.784000+00:00
-- started: 2026-07-29T14:05:20.213000+00:00
-- ended: 2026-07-29T14:05:23.285000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
