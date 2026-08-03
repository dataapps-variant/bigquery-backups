-- job_id: script_job_0e27cc0d98ee855e7245fc7a325fa097_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:00:23.667000+00:00
-- started: 2026-07-29T09:00:23.762000+00:00
-- ended: 2026-07-29T09:00:23.861000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
