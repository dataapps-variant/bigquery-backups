-- job_id: sheets_dataconnector_scheduled_33ba08b5-119a-4d4e-977f-c1100e4b9d26
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T13:07:50.029000+00:00
-- started: 2026-08-03T13:07:50.120000+00:00
-- ended: 2026-08-03T13:07:50.312000+00:00

SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,MAX(`Spend_Country_Code_AFID`)) AS `Spend_Country_Code_AFID`, IF(__mask & 4=0,NULL,`Date_of_Sale`) AS `Date_of_Sale`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day`
)CROSS JOIN UNNEST([4,7]) __mask)  WHERE ((`Date_of_Sale` > '2025-5-16') AND (UPPER(`App_Name`) IN (UPPER('CT'))) AND (`AFID_CHANNEL` IN (99)))
  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,UPPER(`Spend_Country_Code_AFID`)), IF(__mask & 4=0,NULL,`Date_of_Sale`)
