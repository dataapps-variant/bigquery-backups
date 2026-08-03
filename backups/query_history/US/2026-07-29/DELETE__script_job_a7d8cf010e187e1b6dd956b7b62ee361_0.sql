-- job_id: script_job_a7d8cf010e187e1b6dd956b7b62ee361_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T10:23:06.768000+00:00
-- started: 2026-07-29T10:23:07.137000+00:00
-- ended: 2026-07-29T10:23:17.488000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
