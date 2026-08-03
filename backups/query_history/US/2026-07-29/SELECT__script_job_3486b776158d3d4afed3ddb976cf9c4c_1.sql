-- job_id: script_job_3486b776158d3d4afed3ddb976cf9c4c_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:06.392000+00:00
-- started: 2026-07-29T08:45:06.447000+00:00
-- ended: 2026-07-29T08:45:06.667000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`
)).*;
