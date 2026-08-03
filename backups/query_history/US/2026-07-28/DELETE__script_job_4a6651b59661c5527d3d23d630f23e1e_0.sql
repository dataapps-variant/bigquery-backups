-- job_id: script_job_4a6651b59661c5527d3d23d630f23e1e_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:01.565000+00:00
-- started: 2026-07-28T08:45:02.039000+00:00
-- ended: 2026-07-28T08:45:03.534000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
