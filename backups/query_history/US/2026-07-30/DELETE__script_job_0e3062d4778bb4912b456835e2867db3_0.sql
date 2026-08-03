-- job_id: script_job_0e3062d4778bb4912b456835e2867db3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:55:08.375000+00:00
-- started: 2026-07-30T10:55:08.861000+00:00
-- ended: 2026-07-30T10:55:12.380000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
