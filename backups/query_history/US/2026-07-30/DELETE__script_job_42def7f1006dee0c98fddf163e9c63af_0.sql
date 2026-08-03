-- job_id: script_job_42def7f1006dee0c98fddf163e9c63af_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:03:12.131000+00:00
-- started: 2026-07-30T10:03:12.602000+00:00
-- ended: 2026-07-30T10:03:15.376000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
