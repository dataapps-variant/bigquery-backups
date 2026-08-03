-- job_id: script_job_319502714fa1f7b28a7c6360e4964ed2_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:53:42.548000+00:00
-- started: 2026-07-30T10:53:42.880000+00:00
-- ended: 2026-07-30T10:53:44.472000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
