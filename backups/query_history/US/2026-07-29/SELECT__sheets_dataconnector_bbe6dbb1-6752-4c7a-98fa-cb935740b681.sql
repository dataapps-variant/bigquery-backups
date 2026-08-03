-- job_id: sheets_dataconnector_bbe6dbb1-6752-4c7a-98fa-cb935740b681
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:43:35.419000+00:00
-- started: 2026-07-29T09:43:35.488000+00:00
-- ended: 2026-07-29T09:43:35.580000+00:00

  SELECT `Date_of_Sale` AS `Date_of_Sale`, `App_Name` AS `App_Name`, `AFID_CHANNEL` AS `AFID_CHANNEL`, `Spend_Country_Code_AFID` AS `Spend_Country_Code_AFID`, `Product_Name_Final` AS `Product_Name_Final`, `BC` AS `BC`, `Daily_Users` AS `Daily_Users`
  FROM (
SELECT * FROM `variant-finance-data-project.Sticky_Data.User_Count_by_Day`
)
  WHERE ((UPPER(IFNULL(`App_Name`, '')) LIKE UPPER('%FS%')))
  LIMIT 25000
