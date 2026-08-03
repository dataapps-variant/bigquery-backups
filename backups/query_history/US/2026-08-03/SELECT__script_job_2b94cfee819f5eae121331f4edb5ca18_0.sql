-- job_id: script_job_2b94cfee819f5eae121331f4edb5ca18_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:00:05.640000+00:00
-- started: 2026-08-03T09:00:05.740000+00:00
-- ended: 2026-08-03T09:00:11.691000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
