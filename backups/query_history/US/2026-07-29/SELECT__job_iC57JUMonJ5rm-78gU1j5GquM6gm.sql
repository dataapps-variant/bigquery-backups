-- job_id: job_iC57JUMonJ5rm-78gU1j5GquM6gm
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:47:29.581000+00:00
-- started: 2026-07-29T10:47:29.663000+00:00
-- ended: 2026-07-29T10:47:30.002000+00:00

SELECT
  Reporting_Date,
  App_Name,
  AFID,
  Recent_CAC,
  T7D_Spend,
  BC4_Net_LTV_Discounted,
  Cohort,
  Table
FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_App_AFID_Level`
WHERE Reporting_Date = "2026-07-21"
  AND Cohort = "7K_30D"
  AND Table  = "Regular"
ORDER BY App_Name, AFID;
