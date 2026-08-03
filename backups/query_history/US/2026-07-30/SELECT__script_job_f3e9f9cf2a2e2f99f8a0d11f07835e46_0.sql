-- job_id: script_job_f3e9f9cf2a2e2f99f8a0d11f07835e46_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:00:06.931000+00:00
-- started: 2026-07-30T09:00:07.102000+00:00
-- ended: 2026-07-30T09:00:09.406000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
