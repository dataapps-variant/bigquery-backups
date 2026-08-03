-- job_id: script_job_3016e0d4ab25cbd469a9f8727b74648a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:30:02.914000+00:00
-- started: 2026-07-28T08:30:03.281000+00:00
-- ended: 2026-07-28T08:30:04.518000+00:00

DELETE FROM `variant-finance-data-project.VPU.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
