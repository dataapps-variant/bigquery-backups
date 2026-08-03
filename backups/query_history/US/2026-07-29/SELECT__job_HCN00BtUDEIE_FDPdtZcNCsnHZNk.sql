-- job_id: job_HCN00BtUDEIE_FDPdtZcNCsnHZNk
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:47:44.575000+00:00
-- started: 2026-07-29T10:47:44.658000+00:00
-- ended: 2026-07-29T10:47:44.934000+00:00

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
WHERE Reporting_Date = "2026-07-28"
  AND Cohort = "7K_30D"
  AND Table  = "Regular"
ORDER BY App_Name, AFID;
