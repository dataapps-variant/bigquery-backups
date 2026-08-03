-- job_id: sheets_dataconnector_923dd152-7bf0-42a9-b605-8f8112572cb0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T10:09:13.664000+00:00
-- started: 2026-08-03T10:09:13.722000+00:00
-- ended: 2026-08-03T10:09:13.986000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
