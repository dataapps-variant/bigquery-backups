-- job_id: sheets_dataconnector_scheduled_9a33a8ca-50b8-4111-811b-739f19f52417
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T05:06:16.886000+00:00
-- started: 2026-08-01T05:06:17.013000+00:00
-- ended: 2026-08-01T05:06:17.201000+00:00

SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,MAX(`Product_Name_Final`)) AS `Product_Name_Final`, IF(__mask & 4=0,NULL,DATE_TRUNC(`Date_of_Sale`, MONTH)) AS `Date_of_Sale_groupedBy_YEAR_MONTH`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)CROSS JOIN UNNEST([4,5,7]) __mask)  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,UPPER(`Product_Name_Final`)), IF(__mask & 4=0,NULL,DATE_TRUNC(`Date_of_Sale`, MONTH))
