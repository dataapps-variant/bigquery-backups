-- job_id: script_job_ec4c7440d987f56055786783efc3f9ce_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:03.868000+00:00
-- started: 2026-07-29T08:45:04.533000+00:00
-- ended: 2026-07-29T08:45:07.432000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
