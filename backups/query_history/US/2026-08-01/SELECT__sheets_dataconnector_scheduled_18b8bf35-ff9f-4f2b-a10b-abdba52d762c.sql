-- job_id: sheets_dataconnector_scheduled_18b8bf35-ff9f-4f2b-a10b-abdba52d762c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T16:53:46.717000+00:00
-- started: 2026-08-01T16:53:46.995000+00:00
-- ended: 2026-08-01T16:53:47.205000+00:00

SELECT BIT_COUNT(__mask & 1) AS rowDepth, BIT_COUNT(__mask & 2) AS colDepth, IF(__mask & 1=0,NULL,`Date_of_Sale`) AS `Date_of_Sale`, IF(__mask & 2=0,NULL,MAX(`Product_Name_Final`)) AS `Product_Name_Final`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)CROSS JOIN UNNEST([3]) __mask)  WHERE ((UPPER(`App_Name`) IN (UPPER('DT'))))
  GROUP BY __mask, IF(__mask & 1=0,NULL,`Date_of_Sale`), IF(__mask & 2=0,NULL,UPPER(`Product_Name_Final`))
