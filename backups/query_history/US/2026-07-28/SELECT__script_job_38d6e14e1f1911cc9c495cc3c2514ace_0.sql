-- job_id: script_job_38d6e14e1f1911cc9c495cc3c2514ace_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:00:09.187000+00:00
-- started: 2026-07-28T09:00:09.236000+00:00
-- ended: 2026-07-28T09:00:18.214000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
