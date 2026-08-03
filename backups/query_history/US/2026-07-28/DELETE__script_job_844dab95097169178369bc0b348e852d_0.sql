-- job_id: script_job_844dab95097169178369bc0b348e852d_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:02.607000+00:00
-- started: 2026-07-28T08:45:02.964000+00:00
-- ended: 2026-07-28T08:45:04.006000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
