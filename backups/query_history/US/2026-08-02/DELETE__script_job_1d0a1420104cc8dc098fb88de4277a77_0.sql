-- job_id: script_job_1d0a1420104cc8dc098fb88de4277a77_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:30:03.824000+00:00
-- started: 2026-08-02T08:30:04.325000+00:00
-- ended: 2026-08-02T08:30:05.444000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
