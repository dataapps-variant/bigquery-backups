-- job_id: script_job_0484167ffbbad2f7391565dd4503d375_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:04.630000+00:00
-- started: 2026-07-31T08:45:04.901000+00:00
-- ended: 2026-07-31T08:45:06.122000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
