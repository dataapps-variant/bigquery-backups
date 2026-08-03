-- job_id: sheets_dataconnector_scheduled_a1180f7f-0506-471b-b8e1-01e21303f1c3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T05:25:54.958000+00:00
-- started: 2026-07-30T05:25:55.075000+00:00
-- ended: 2026-07-30T05:25:55.175000+00:00

SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,`AFID_CHANNEL`) AS `AFID_CHANNEL`, IF(__mask & 4=0,NULL,`Date_of_Sale`) AS `Date_of_Sale`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day`
)CROSS JOIN UNNEST([4,7]) __mask)  WHERE ((`Date_of_Sale` > '2025-5-16') AND (UPPER(`App_Name`) IN (UPPER('CT'))))
  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,`AFID_CHANNEL`), IF(__mask & 4=0,NULL,`Date_of_Sale`)
