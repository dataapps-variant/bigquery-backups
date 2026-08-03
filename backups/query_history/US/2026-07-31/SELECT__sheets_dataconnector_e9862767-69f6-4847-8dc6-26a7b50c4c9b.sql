-- job_id: sheets_dataconnector_e9862767-69f6-4847-8dc6-26a7b50c4c9b
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:54:32.539000+00:00
-- started: 2026-07-31T09:54:32.639000+00:00
-- ended: 2026-07-31T09:54:32.724000+00:00

SELECT BIT_COUNT(__mask & 1) AS rowDepth, BIT_COUNT(__mask & 2) AS colDepth, IF(__mask & 1=0,NULL,`Date_of_Sale`) AS `Date_of_Sale`, IF(__mask & 2=0,NULL,MAX(`Product_Name_Final`)) AS `Product_Name_Final`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)CROSS JOIN UNNEST([3]) __mask)  WHERE ((UPPER(`App_Name`) IN (UPPER('DT'))))
  GROUP BY __mask, IF(__mask & 1=0,NULL,`Date_of_Sale`), IF(__mask & 2=0,NULL,UPPER(`Product_Name_Final`))
