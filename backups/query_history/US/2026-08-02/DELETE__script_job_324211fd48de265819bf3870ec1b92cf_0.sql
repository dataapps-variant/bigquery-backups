-- job_id: script_job_324211fd48de265819bf3870ec1b92cf_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:02.982000+00:00
-- started: 2026-08-02T08:45:03.259000+00:00
-- ended: 2026-08-02T08:45:04.507000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
