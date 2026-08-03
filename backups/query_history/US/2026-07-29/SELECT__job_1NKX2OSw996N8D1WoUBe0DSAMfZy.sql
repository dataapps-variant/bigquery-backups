-- job_id: job_1NKX2OSw996N8D1WoUBe0DSAMfZy
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:17:10.028000+00:00
-- started: 2026-07-29T11:17:10.112000+00:00
-- ended: 2026-07-29T11:17:10.217000+00:00

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
