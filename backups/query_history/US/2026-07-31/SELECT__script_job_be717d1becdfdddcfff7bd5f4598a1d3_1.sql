-- job_id: script_job_be717d1becdfdddcfff7bd5f4598a1d3_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:15:04.676000+00:00
-- started: 2026-07-31T09:15:04.759000+00:00
-- ended: 2026-07-31T09:15:04.989000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
)).*;
