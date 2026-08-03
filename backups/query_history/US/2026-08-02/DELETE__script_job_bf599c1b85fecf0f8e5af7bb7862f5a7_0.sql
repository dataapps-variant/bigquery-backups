-- job_id: script_job_bf599c1b85fecf0f8e5af7bb7862f5a7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:01.787000+00:00
-- started: 2026-08-02T08:45:02.202000+00:00
-- ended: 2026-08-02T08:45:03.307000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
