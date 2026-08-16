CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.CAC_By_Traffic_Channel_7D` AS

SELECT 
  Date,
  App_Name,
  Entity,
  Traffic_Channel,
  'Daily_CAC' AS Metric,
  Daily_CAC,
  NULL AS T7D_CAC
FROM `variant-finance-data-project.Daedalus.Daedalus_Traffic_Channel_7D`

UNION ALL

SELECT 
  Date,
  App_Name,
  Entity,
  Traffic_Channel,
  'T7D_CAC' AS Metric,
  NULL AS Daily_CAC,
  T7D_CAC
FROM `variant-finance-data-project.Daedalus.Daedalus_Traffic_Channel_7D`

ORDER BY Date, App_Name, Traffic_Channel, Metric;
