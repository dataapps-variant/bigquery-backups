-- job_id: script_job_9f01b623bd930d615299238b7dedf470_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T09:15:05.542000+00:00
-- started: 2026-08-02T09:15:05.910000+00:00
-- ended: 2026-08-02T09:15:07.083000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
