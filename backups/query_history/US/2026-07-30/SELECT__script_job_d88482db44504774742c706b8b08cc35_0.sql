-- job_id: script_job_d88482db44504774742c706b8b08cc35_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:00:08.333000+00:00
-- started: 2026-07-30T09:00:08.443000+00:00
-- ended: 2026-07-30T09:00:11.543000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
