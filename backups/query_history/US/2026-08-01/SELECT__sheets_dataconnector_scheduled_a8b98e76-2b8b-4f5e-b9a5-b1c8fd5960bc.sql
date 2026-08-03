-- job_id: sheets_dataconnector_scheduled_a8b98e76-2b8b-4f5e-b9a5-b1c8fd5960bc
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T16:53:47.267000+00:00
-- started: 2026-08-01T16:53:47.372000+00:00
-- ended: 2026-08-01T16:53:47.631000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
