-- job_id: script_job_07b2b3def8375d643f3ba251bec7becf_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:55:53.547000+00:00
-- started: 2026-07-30T10:55:54.054000+00:00
-- ended: 2026-07-30T10:55:55.686000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
