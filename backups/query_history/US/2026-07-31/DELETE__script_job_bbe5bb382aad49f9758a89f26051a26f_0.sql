-- job_id: script_job_bbe5bb382aad49f9758a89f26051a26f_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:30:02.192000+00:00
-- started: 2026-07-31T08:30:02.540000+00:00
-- ended: 2026-07-31T08:30:03.617000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
