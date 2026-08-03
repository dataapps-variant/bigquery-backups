-- job_id: script_job_dd8593c06398d8840caa4329970513c4_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T14:10:02.884000+00:00
-- started: 2026-07-29T14:10:03.268000+00:00
-- ended: 2026-07-29T14:10:05.834000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
