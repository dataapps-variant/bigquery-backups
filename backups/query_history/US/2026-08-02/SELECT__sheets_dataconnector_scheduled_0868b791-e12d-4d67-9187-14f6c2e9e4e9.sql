-- job_id: sheets_dataconnector_scheduled_0868b791-e12d-4d67-9187-14f6c2e9e4e9
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T04:52:31.824000+00:00
-- started: 2026-08-02T04:52:31.955000+00:00
-- ended: 2026-08-02T04:52:32.182000+00:00

WITH
`_filteredQuery_` AS (
  SELECT * FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
),
`_breakoutLimitAppliedQuery_` AS (
  SELECT `_tL_`.*
  FROM `_filteredQuery_` AS `_tL_`
  JOIN (
  SELECT `Date_of_Sale`
  FROM (
  SELECT `baseQuery`.`Date_of_Sale` AS `Date_of_Sale`
  FROM `_filteredQuery_` AS `baseQuery`
  GROUP BY `Date_of_Sale`)
  ORDER BY `Date_of_Sale` DESC
  LIMIT 100) AS `_tR_`
  ON ((`_tL_`.`Date_of_Sale` = `_tR_`.`Date_of_Sale`) OR (`_tL_`.`Date_of_Sale` IS NULL AND `_tR_`.`Date_of_Sale` IS NULL))
)
SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,MAX(`Product_Name_Final`)) AS `Product_Name_Final`, IF(__mask & 4=0,NULL,`Date_of_Sale`) AS `Date_of_Sale`, SUM(`Daily_Users`) AS `agg0_`
FROM (`_breakoutLimitAppliedQuery_`CROSS JOIN UNNEST([4,5,7]) __mask)  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,UPPER(`Product_Name_Final`)), IF(__mask & 4=0,NULL,`Date_of_Sale`)
