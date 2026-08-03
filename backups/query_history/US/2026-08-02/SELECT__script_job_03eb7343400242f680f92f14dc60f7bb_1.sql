-- job_id: script_job_03eb7343400242f680f92f14dc60f7bb_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:05.169000+00:00
-- started: 2026-08-02T08:45:05.207000+00:00
-- ended: 2026-08-02T08:45:05.388000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
)).*;
