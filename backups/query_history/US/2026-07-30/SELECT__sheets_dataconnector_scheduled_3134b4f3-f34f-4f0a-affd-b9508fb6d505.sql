-- job_id: sheets_dataconnector_scheduled_3134b4f3-f34f-4f0a-affd-b9508fb6d505
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T04:30:18.695000+00:00
-- started: 2026-07-30T04:30:18.781000+00:00
-- ended: 2026-07-30T04:30:19.043000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
