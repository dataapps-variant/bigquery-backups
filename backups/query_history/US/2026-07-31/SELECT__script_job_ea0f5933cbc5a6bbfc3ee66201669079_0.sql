-- job_id: script_job_ea0f5933cbc5a6bbfc3ee66201669079_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:13:16.347000+00:00
-- started: 2026-07-31T10:13:16.548000+00:00
-- ended: 2026-07-31T10:13:17.902000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
