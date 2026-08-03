-- job_id: script_job_e5859e033bd49ab4abca0bbc4ccccc9a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:03.475000+00:00
-- started: 2026-07-30T08:45:03.976000+00:00
-- ended: 2026-07-30T08:45:06.490000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
