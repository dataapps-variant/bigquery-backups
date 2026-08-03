-- job_id: script_job_801583201ab42025df67721805aa3a84_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:30:01.693000+00:00
-- started: 2026-08-03T08:30:02.146000+00:00
-- ended: 2026-08-03T08:30:03.236000+00:00

DELETE FROM `variant-finance-data-project.VPU.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
