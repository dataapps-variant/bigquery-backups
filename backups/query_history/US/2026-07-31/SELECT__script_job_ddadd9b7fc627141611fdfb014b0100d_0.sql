-- job_id: script_job_ddadd9b7fc627141611fdfb014b0100d_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:47:36.663000+00:00
-- started: 2026-07-31T12:47:36.837000+00:00
-- ended: 2026-07-31T12:47:38.170000+00:00

SELECT STRUCT<DATE>((
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)).*;
