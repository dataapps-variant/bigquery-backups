-- job_id: script_job_87decff4ec5ae46a1d9d202927eb6212_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:12:54.159000+00:00
-- started: 2026-07-28T18:12:54.576000+00:00
-- ended: 2026-07-28T18:13:11.257000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
