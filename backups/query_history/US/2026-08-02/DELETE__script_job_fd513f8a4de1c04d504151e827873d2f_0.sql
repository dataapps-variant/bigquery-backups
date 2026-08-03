-- job_id: script_job_fd513f8a4de1c04d504151e827873d2f_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:04.574000+00:00
-- started: 2026-08-02T08:45:04.969000+00:00
-- ended: 2026-08-02T08:45:06.202000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
