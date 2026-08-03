-- job_id: sheets_dataconnector_8c654f0f-c58d-4ba3-9bc5-fcc68a1b2ccc
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:54:33.437000+00:00
-- started: 2026-07-31T09:54:33.509000+00:00
-- ended: 2026-07-31T09:54:33.595000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
