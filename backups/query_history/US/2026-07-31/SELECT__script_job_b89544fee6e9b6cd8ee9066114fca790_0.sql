-- job_id: script_job_b89544fee6e9b6cd8ee9066114fca790_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:00:13.915000+00:00
-- started: 2026-07-31T09:00:14.088000+00:00
-- ended: 2026-07-31T09:00:15.478000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
