-- job_id: script_job_f3880251f0c3255694e52a696b9da3b1_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:00:02.417000+00:00
-- started: 2026-08-01T09:00:02.553000+00:00
-- ended: 2026-08-01T09:00:03.447000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
