-- job_id: script_job_4435decccd160abb1aceebadeebb5a74_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T10:00:06.857000+00:00
-- started: 2026-08-03T10:00:07.293000+00:00
-- ended: 2026-08-03T10:00:09.223000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
