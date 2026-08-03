-- job_id: sheets_dataconnector_scheduled_caf6527b-1b47-46e1-9292-e4c5f2ef68f2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T16:58:20.155000+00:00
-- started: 2026-08-02T16:58:20.225000+00:00
-- ended: 2026-08-02T16:58:20.438000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
