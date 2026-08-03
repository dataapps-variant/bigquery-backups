-- job_id: script_job_f90efbca63ac1cfca82793a59cb10157_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T17:50:55.020000+00:00
-- started: 2026-07-28T17:50:55.480000+00:00
-- ended: 2026-07-28T17:50:57.082000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
