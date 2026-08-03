-- job_id: script_job_d7e682f311e92848c75fc79f4e5e6857_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:01.702000+00:00
-- started: 2026-08-02T08:45:02.038000+00:00
-- ended: 2026-08-02T08:45:03.043000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
