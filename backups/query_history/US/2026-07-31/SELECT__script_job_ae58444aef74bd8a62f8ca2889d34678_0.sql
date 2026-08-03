-- job_id: script_job_ae58444aef74bd8a62f8ca2889d34678_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:00:17.098000+00:00
-- started: 2026-07-31T09:00:17.167000+00:00
-- ended: 2026-07-31T09:00:17.275000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
