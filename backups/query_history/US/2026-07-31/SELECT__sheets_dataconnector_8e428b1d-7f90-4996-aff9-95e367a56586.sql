-- job_id: sheets_dataconnector_8e428b1d-7f90-4996-aff9-95e367a56586
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:52:51.570000+00:00
-- started: 2026-07-31T10:52:51.636000+00:00
-- ended: 2026-07-31T10:52:51.792000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
