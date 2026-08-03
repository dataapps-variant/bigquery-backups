-- job_id: script_job_342f810f8c35fce7a0b45c5e075b2844_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:01.830000+00:00
-- started: 2026-08-02T08:45:02.237000+00:00
-- ended: 2026-08-02T08:45:03.275000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
