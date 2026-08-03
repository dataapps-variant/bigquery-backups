-- job_id: script_job_c6ba120ef04b0a80670f7509749f2d93_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T10:12:25.522000+00:00
-- started: 2026-07-29T10:12:25.910000+00:00
-- ended: 2026-07-29T10:12:30.761000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
