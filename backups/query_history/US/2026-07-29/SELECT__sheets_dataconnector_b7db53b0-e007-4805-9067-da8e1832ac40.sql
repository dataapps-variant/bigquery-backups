-- job_id: sheets_dataconnector_b7db53b0-e007-4805-9067-da8e1832ac40
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:47:35.267000+00:00
-- started: 2026-07-29T09:47:35.316000+00:00
-- ended: 2026-07-29T09:47:35.450000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
