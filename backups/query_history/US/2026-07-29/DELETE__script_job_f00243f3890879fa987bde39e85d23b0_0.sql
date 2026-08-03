-- job_id: script_job_f00243f3890879fa987bde39e85d23b0_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T10:17:36.542000+00:00
-- started: 2026-07-29T10:17:36.892000+00:00
-- ended: 2026-07-29T10:17:39.183000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
