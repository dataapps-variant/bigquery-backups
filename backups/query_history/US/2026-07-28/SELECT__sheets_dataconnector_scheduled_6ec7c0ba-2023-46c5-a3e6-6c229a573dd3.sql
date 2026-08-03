-- job_id: sheets_dataconnector_scheduled_6ec7c0ba-2023-46c5-a3e6-6c229a573dd3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T04:16:39.714000+00:00
-- started: 2026-07-28T04:16:39.777000+00:00
-- ended: 2026-07-28T04:16:40.003000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
