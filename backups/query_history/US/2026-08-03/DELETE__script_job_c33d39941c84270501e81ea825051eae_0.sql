-- job_id: script_job_c33d39941c84270501e81ea825051eae_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:02.019000+00:00
-- started: 2026-08-03T08:45:02.538000+00:00
-- ended: 2026-08-03T08:45:03.748000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
