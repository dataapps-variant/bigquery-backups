-- job_id: sheets_dataconnector_f5e787c2-0448-4a5a-bad8-4575aba688b2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:38:52.303000+00:00
-- started: 2026-07-30T09:38:52.344000+00:00
-- ended: 2026-07-30T09:38:52.421000+00:00

SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,MAX(`Product_Name_Final`)) AS `Product_Name_Final`, IF(__mask & 4=0,NULL,`Date_of_Sale`) AS `Date_of_Sale`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)CROSS JOIN UNNEST([4,5,7]) __mask)  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,UPPER(`Product_Name_Final`)), IF(__mask & 4=0,NULL,`Date_of_Sale`)
