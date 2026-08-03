-- job_id: job_EYFDKuMbJZrI0VVejzPpUjcy051I
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:50:35.817000+00:00
-- started: 2026-07-29T10:50:35.925000+00:00
-- ended: 2026-07-29T10:50:36.118000+00:00

SELECT
  Reporting_Date,
  App_Name,
  Recent_CAC,
  T7D_Spend,
  BC4_Net_LTV_Discounted,
  Cohort,
  Table
FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_App_Level`
WHERE Reporting_Date = "2026-07-28"
  AND Cohort = "7K_30D"
  AND Table  = "Regular"
ORDER BY App_Name;
