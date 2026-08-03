-- job_id: scheduled_query_6ab56c5a-0000-268c-9e95-ac3eb15e268c
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T08:15:01.154000+00:00
-- started: 2026-08-03T08:15:01.481000+00:00
-- ended: 2026-08-03T08:15:02.694000+00:00


CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Country_List` AS

SELECT
  CASE
    WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
    WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
    ELSE App_Name
  END AS App_Name,
  Spend_Country_Code_AFID,
  COUNT(DISTINCT Updated_Cust_ID) AS Last_30D_Users,
  CASE 
    WHEN COUNT(DISTINCT Updated_Cust_ID) > 50 THEN 'Yes' 
    ELSE 'No' 
  END AS Last_30D_Over_50
FROM
  `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE
  Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
  AND Date_of_Sale < CURRENT_DATE()
  AND Spend_Country_Code_AFID IS NOT NULL
  AND (
    (RIGHT(Product_Name_Final, 2) = 'NT' AND Billing_Cycle_Updated = 1)
    OR
    (RIGHT(Product_Name_Final, 2) != 'NT' AND Billing_Cycle_Updated = 0)
  )
GROUP BY
  App_Name, Spend_Country_Code_AFID
ORDER BY App_Name, Spend_Country_Code_AFID;
