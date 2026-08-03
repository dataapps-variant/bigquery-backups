-- job_id: script_job_db0670ca1b5ee5cfece5f711757e5862_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:00:07.970000+00:00
-- started: 2026-07-28T09:00:08.063000+00:00
-- ended: 2026-07-28T09:00:09.474000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
