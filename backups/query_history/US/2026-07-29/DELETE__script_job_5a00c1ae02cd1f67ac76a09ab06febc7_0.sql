-- job_id: script_job_5a00c1ae02cd1f67ac76a09ab06febc7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:02.940000+00:00
-- started: 2026-07-29T08:45:03.263000+00:00
-- ended: 2026-07-29T08:45:05.721000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
