-- job_id: script_job_0cbe7d20d6aa447a30cb9ef6253b8e63_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:06.854000+00:00
-- started: 2026-07-29T08:45:06.930000+00:00
-- ended: 2026-07-29T08:45:07.115000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
)).*;
