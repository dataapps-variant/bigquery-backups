-- job_id: sheets_dataconnector_945ba65f-51a2-481f-86c6-265b1f541da1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:53:15.231000+00:00
-- started: 2026-07-28T08:53:15.304000+00:00
-- ended: 2026-07-28T08:53:15.593000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
