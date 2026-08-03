-- job_id: script_job_f259d44ad858fd134175c1f8bb61cff3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:16:04.170000+00:00
-- started: 2026-07-30T10:16:04.948000+00:00
-- ended: 2026-07-30T10:16:07.465000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
