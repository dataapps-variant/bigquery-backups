-- job_id: script_job_b5a23b834aced452a8679d81cbb9527d_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:00:13.449000+00:00
-- started: 2026-07-29T09:00:13.538000+00:00
-- ended: 2026-07-29T09:00:15.418000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
