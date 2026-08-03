-- job_id: sheets_dataconnector_81963a55-b11b-4ba0-b8bf-490851d2662c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:38:52.855000+00:00
-- started: 2026-07-30T09:38:52.918000+00:00
-- ended: 2026-07-30T09:38:53.004000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
