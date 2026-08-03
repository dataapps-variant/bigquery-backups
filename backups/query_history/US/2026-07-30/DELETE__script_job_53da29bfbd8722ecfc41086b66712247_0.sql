-- job_id: script_job_53da29bfbd8722ecfc41086b66712247_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:54:27.225000+00:00
-- started: 2026-07-30T10:54:27.627000+00:00
-- ended: 2026-07-30T10:54:29.976000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
