-- job_id: script_job_9bb90653473844782b12ed2a3e1b349a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T09:45:02.914000+00:00
-- started: 2026-08-02T09:45:03.309000+00:00
-- ended: 2026-08-02T09:45:04.588000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
