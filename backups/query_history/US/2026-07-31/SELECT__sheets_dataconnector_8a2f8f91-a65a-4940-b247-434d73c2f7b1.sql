-- job_id: sheets_dataconnector_8a2f8f91-a65a-4940-b247-434d73c2f7b1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:54:32.675000+00:00
-- started: 2026-07-31T09:54:32.745000+00:00
-- ended: 2026-07-31T09:54:32.840000+00:00

SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,MAX(`Product_Name_Final`)) AS `Product_Name_Final`, IF(__mask & 4=0,NULL,DATE_TRUNC(`Date_of_Sale`, MONTH)) AS `Date_of_Sale_groupedBy_YEAR_MONTH`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)CROSS JOIN UNNEST([4,5,7]) __mask)  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,UPPER(`Product_Name_Final`)), IF(__mask & 4=0,NULL,DATE_TRUNC(`Date_of_Sale`, MONTH))
