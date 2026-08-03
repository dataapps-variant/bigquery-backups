-- job_id: script_job_61433d522731e0d846ce1d57e56f10d3_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:00:13.859000+00:00
-- started: 2026-08-02T09:00:13.957000+00:00
-- ended: 2026-08-02T09:00:14.063000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
