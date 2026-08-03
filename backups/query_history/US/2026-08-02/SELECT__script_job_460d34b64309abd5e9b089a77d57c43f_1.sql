-- job_id: script_job_460d34b64309abd5e9b089a77d57c43f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.546000+00:00
-- started: 2026-08-02T08:45:03.632000+00:00
-- ended: 2026-08-02T08:45:03.849000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
)).*;
