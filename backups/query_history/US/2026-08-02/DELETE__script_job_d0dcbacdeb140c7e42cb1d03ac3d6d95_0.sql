-- job_id: script_job_d0dcbacdeb140c7e42cb1d03ac3d6d95_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T10:00:21.046000+00:00
-- started: 2026-08-02T10:00:21.620000+00:00
-- ended: 2026-08-02T10:00:23.045000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
