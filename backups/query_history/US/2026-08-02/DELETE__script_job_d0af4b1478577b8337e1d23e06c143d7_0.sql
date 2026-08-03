-- job_id: script_job_d0af4b1478577b8337e1d23e06c143d7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:01.812000+00:00
-- started: 2026-08-02T08:45:02.298000+00:00
-- ended: 2026-08-02T08:45:03.424000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
