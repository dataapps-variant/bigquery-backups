-- job_id: script_job_a7ae57de1af45cbd834d9fd4a1c749cb_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:05.422000+00:00
-- started: 2026-08-02T08:45:06.471000+00:00
-- ended: 2026-08-02T08:45:07.627000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
