-- job_id: dffdb9e9-1240-4940-aa71-08718d6fe63d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:00:08.147000+00:00
-- started: 2026-07-29T12:00:08.240000+00:00
-- ended: 2026-07-29T12:00:08.462000+00:00

SELECT `Table` t,
  MAX(Reporting_Date) max_row_date,
  MAX(IF(Net_LTV_Discounted IS NOT NULL, Reporting_Date, NULL)) max_ltv_date,
  MAX(IF(Net_ARPU_Discounted IS NOT NULL, Reporting_Date, NULL)) max_arpu_date
 FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort='7K_30D' GROUP BY 1
