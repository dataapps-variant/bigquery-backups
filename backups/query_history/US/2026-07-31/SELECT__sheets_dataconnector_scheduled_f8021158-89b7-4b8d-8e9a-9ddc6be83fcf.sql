-- job_id: sheets_dataconnector_scheduled_f8021158-89b7-4b8d-8e9a-9ddc6be83fcf
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T05:21:35.685000+00:00
-- started: 2026-07-31T05:21:35.745000+00:00
-- ended: 2026-07-31T05:21:36.109000+00:00

SELECT BIT_COUNT(__mask & 1) AS rowDepth, BIT_COUNT(__mask & 2) AS colDepth, IF(__mask & 1=0,NULL,`Date_of_Sale`) AS `Date_of_Sale`, IF(__mask & 2=0,NULL,MAX(`Product_Name_Final`)) AS `Product_Name_Final`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)CROSS JOIN UNNEST([3]) __mask)  WHERE ((UPPER(`App_Name`) IN (UPPER('DT'))))
  GROUP BY __mask, IF(__mask & 1=0,NULL,`Date_of_Sale`), IF(__mask & 2=0,NULL,UPPER(`Product_Name_Final`))
