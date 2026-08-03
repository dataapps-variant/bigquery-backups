-- job_id: script_job_305c7449e60edbd419178f9b83cbbbfc_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:03.520000+00:00
-- started: 2026-07-29T08:45:03.977000+00:00
-- ended: 2026-07-29T08:45:07.656000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
