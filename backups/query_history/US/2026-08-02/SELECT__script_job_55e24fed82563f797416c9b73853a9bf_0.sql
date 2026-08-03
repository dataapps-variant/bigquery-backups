-- job_id: script_job_55e24fed82563f797416c9b73853a9bf_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:00:05.129000+00:00
-- started: 2026-08-02T09:00:05.240000+00:00
-- ended: 2026-08-02T09:00:07.514000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
