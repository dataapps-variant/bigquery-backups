-- job_id: sheets_dataconnector_scheduled_163ebe06-df4a-402b-9076-8b8d0dda3c64
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T16:37:08.088000+00:00
-- started: 2026-07-31T16:37:08.157000+00:00
-- ended: 2026-07-31T16:37:08.386000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
