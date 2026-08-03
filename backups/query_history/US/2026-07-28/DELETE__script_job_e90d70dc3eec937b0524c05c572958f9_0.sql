-- job_id: script_job_e90d70dc3eec937b0524c05c572958f9_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:36:20.651000+00:00
-- started: 2026-07-28T18:36:21.017000+00:00
-- ended: 2026-07-28T18:36:22.940000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
