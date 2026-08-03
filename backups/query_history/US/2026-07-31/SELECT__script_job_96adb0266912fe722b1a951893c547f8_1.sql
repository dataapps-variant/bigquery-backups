-- job_id: script_job_96adb0266912fe722b1a951893c547f8_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.717000+00:00
-- started: 2026-07-31T08:45:05.784000+00:00
-- ended: 2026-07-31T08:45:06.014000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
)).*;
