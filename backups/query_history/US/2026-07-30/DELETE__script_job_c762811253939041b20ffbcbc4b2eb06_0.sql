-- job_id: script_job_c762811253939041b20ffbcbc4b2eb06_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:03.322000+00:00
-- started: 2026-07-30T08:45:03.759000+00:00
-- ended: 2026-07-30T08:45:06.486000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
