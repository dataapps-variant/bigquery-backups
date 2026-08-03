-- job_id: job_RC6mejoEMo29RI1uaG4GbJIe0UOo
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:18:29.957000+00:00
-- started: 2026-07-29T11:18:30.067000+00:00
-- ended: 2026-07-29T11:18:30.413000+00:00

SELECT
  Reporting_Date,
  App_Name,
  Recent_CAC,
  T7D_Spend,
  BC4_Net_LTV_Discounted,
  Cohort,
  Table
FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_App_Level`
WHERE Reporting_Date = "2026-07-21"
  AND Cohort = "7K_30D"
  AND Table  = "Regular"
ORDER BY App_Name;
