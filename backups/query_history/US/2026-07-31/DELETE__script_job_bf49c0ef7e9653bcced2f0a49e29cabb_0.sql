-- job_id: script_job_bf49c0ef7e9653bcced2f0a49e29cabb_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T09:45:05.420000+00:00
-- started: 2026-07-31T09:45:05.900000+00:00
-- ended: 2026-07-31T09:45:07.074000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
