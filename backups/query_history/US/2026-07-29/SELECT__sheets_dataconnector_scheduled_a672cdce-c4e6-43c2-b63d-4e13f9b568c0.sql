-- job_id: sheets_dataconnector_scheduled_a672cdce-c4e6-43c2-b63d-4e13f9b568c0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T20:35:01.733000+00:00
-- started: 2026-07-29T20:35:01.837000+00:00
-- ended: 2026-07-29T20:35:01.965000+00:00

SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,`AFID_CHANNEL`) AS `AFID_CHANNEL`, IF(__mask & 4=0,NULL,`Date_of_Sale`) AS `Date_of_Sale`, SUM(`Daily_Users`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day`
)CROSS JOIN UNNEST([4,7]) __mask)  WHERE ((`Date_of_Sale` > '2025-5-16') AND (UPPER(`App_Name`) IN (UPPER('CT'))))
  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,`AFID_CHANNEL`), IF(__mask & 4=0,NULL,`Date_of_Sale`)
