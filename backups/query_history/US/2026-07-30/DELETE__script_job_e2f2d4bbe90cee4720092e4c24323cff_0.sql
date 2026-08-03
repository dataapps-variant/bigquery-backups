-- job_id: script_job_e2f2d4bbe90cee4720092e4c24323cff_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:11:09.807000+00:00
-- started: 2026-07-30T10:11:10.216000+00:00
-- ended: 2026-07-30T10:11:12.581000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
