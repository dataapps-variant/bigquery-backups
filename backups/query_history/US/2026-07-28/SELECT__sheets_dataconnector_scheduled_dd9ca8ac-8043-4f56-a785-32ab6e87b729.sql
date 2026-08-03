-- job_id: sheets_dataconnector_scheduled_dd9ca8ac-8043-4f56-a785-32ab6e87b729
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:33:17.418000+00:00
-- started: 2026-07-28T12:33:17.585000+00:00
-- ended: 2026-07-28T12:33:17.847000+00:00

SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,MAX(`Spend_Country_Code_AFID`)) AS `Spend_Country_Code_AFID`, IF(__mask & 4=0,NULL,`Date_of_Sale`) AS `Date_of_Sale`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day`
)CROSS JOIN UNNEST([4,7]) __mask)  WHERE ((`Date_of_Sale` > '2025-5-16') AND (UPPER(`App_Name`) IN (UPPER('CT'))) AND (`AFID_CHANNEL` IN (99)))
  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,UPPER(`Spend_Country_Code_AFID`)), IF(__mask & 4=0,NULL,`Date_of_Sale`)
