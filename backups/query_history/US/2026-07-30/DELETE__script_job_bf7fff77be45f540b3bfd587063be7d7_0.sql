-- job_id: script_job_bf7fff77be45f540b3bfd587063be7d7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:22:42.984000+00:00
-- started: 2026-07-30T10:22:43.396000+00:00
-- ended: 2026-07-30T10:22:46.079000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
