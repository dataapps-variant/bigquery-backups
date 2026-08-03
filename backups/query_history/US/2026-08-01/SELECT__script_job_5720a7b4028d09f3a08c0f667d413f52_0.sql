-- job_id: script_job_5720a7b4028d09f3a08c0f667d413f52_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:00:05+00:00
-- started: 2026-08-01T09:00:05.080000+00:00
-- ended: 2026-08-01T09:00:05.301000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
