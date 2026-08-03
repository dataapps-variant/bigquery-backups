-- job_id: sheets_dataconnector_0eab31bc-7c8e-4728-a1c6-33b1447f9c70
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:55:06.488000+00:00
-- started: 2026-07-31T09:55:06.562000+00:00
-- ended: 2026-07-31T09:55:06.695000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
