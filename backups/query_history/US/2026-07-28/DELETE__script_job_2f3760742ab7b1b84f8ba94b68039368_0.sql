-- job_id: script_job_2f3760742ab7b1b84f8ba94b68039368_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:26:37.523000+00:00
-- started: 2026-07-28T18:26:37.831000+00:00
-- ended: 2026-07-28T18:26:40.145000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
