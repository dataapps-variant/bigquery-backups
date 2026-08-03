-- job_id: scheduled_query_6a735dd4-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T07:40:01.519000+00:00
-- started: 2026-07-29T07:40:01.886000+00:00
-- ended: 2026-07-29T07:40:03.164000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.StickyvsBQ_Users` AS
SELECT
  Entity_Name,
  App_Name,
  Campaign_Id,
  Date,
  SUM(Users) AS Users,
  SUM(Refund_Users) AS Refund_Users
FROM (
  -- Users by Date_of_Sale
  SELECT
    Entity_Name,
    App_Name,
    Campaign_Id,
    Date_of_Sale AS Date,
    COUNT(Order_Id) AS Users,
    0 AS Refund_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
  GROUP BY Entity_Name, App_Name, Campaign_Id, Date_of_Sale

  UNION ALL

  -- Refund_Users by Acquisition_Date_Time
  SELECT
    Entity_Name,
    App_Name,
    Campaign_Id,
    DATE(Acquisition_Date_Time) AS Date,
    0 AS Users,
    COUNT(Order_Id) AS Refund_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Is_Refund = 'yes'
    AND DATE(Acquisition_Date_Time) >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
  GROUP BY Entity_Name, App_Name, Campaign_Id, DATE(Acquisition_Date_Time)
)
GROUP BY Entity_Name, App_Name, Campaign_Id, Date
ORDER BY Date DESC, Entity_Name, App_Name, Campaign_Id
