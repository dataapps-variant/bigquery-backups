-- job_id: script_job_2c172179a19b5141577731b65b2ffd21_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:05.853000+00:00
-- started: 2026-08-02T08:45:05.951000+00:00
-- ended: 2026-08-02T08:45:06.146000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
)).*;
