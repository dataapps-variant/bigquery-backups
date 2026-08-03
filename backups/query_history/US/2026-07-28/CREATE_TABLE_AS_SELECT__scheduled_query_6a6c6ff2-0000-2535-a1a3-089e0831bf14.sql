-- job_id: scheduled_query_6a6c6ff2-0000-2535-a1a3-089e0831bf14
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T10:06:06.337000+00:00
-- started: 2026-07-28T10:06:07.023000+00:00
-- ended: 2026-07-28T10:06:42.570000+00:00

CREATE OR REPLACE TABLE `Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` AS

WITH base AS (
  SELECT * 
  FROM `Sticky_Data.Sticky_data_API_original_AT_W_EC`
  UNION ALL
  SELECT *  
  FROM `Sticky_Data.Sticky_data_API_original_PD_V_W_EC`
  UNION ALL
  SELECT *  
  FROM `Sticky_Data.Sticky_data_API_original_DT_V_W_EC`
  UNION ALL
  SELECT * 
  FROM `Sticky_Data.Sticky_data_API_original_CN_W_EC`
  UNION ALL
  SELECT * 
  FROM `Sticky_Data.Sticky_data_API_original_FS_W_EC`
  UNION ALL
  SELECT * 
  FROM `Sticky_Data.Sticky_data_API_original_CT_W_EC`
  UNION ALL
  SELECT * EXCEPT(custom_fields)
  FROM `Sticky_Data.Sticky_data_API_original_JF_W_EC`
),

-- ✅ ADDED: Same anchor CTE logic from SQL 1
Anchor_Product_Names AS (
  SELECT
    Updated_Cust_ID,
    Trial_Type,
    App_Name,
    Anchor_Product_Name_Final_Merged
  FROM (
    SELECT
      base.Updated_Cust_ID,
      base.Trial_Type,
      base.App_Name,
      COALESCE(merged_plans.Product_Name_Final_Merged, base.Product_Name_Final) AS Anchor_Product_Name_Final_Merged,
      ROW_NUMBER() OVER (
        PARTITION BY base.Updated_Cust_ID
        ORDER BY base.Date_of_Sale, base.Order_Id
      ) AS rn
    FROM base
    LEFT JOIN `variant-finance-data-project.VPU.VPU_Dim_MergedPlansDetails` merged_plans
      ON base.Product_Name_Final = merged_plans.Product_Name_final
      AND base.Date_of_Sale >= merged_plans.Start_Date
      AND base.Date_of_Sale <= merged_plans.End_Date
    WHERE
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type <> 'NT' AND base.Billing_Cycle_Updated = 0)
  ) ranked
  WHERE rn = 1
)

SELECT
  base.*,

-- Column 1: Decline Reason Category
  dr.Final_Category AS Decline_Reason_Category,

  -- Column 1b: Fault Category (now pulled directly from Decline_Reason_Final)
  dr.Fault_Category AS Fault_Category,

  -- Column 2: Spend Country Code AFID (unchanged)
CASE 
    WHEN afid_dim.Country_Code IS NOT NULL THEN afid_dim.Country_Code
    WHEN spend_dim.Country_Code IS NOT NULL THEN base.Spend_Country_Code
    WHEN app_country_ip.Country_Code IS NOT NULL THEN base.IP_Country_Code
    WHEN app_country_ship.Country_Code IS NOT NULL THEN base.Ship_Country
    WHEN app_country_bill.Country_Code IS NOT NULL THEN base.Bill_Country
    ELSE 'OR'
  END AS Spend_Country_Code_AFID,
  -- Column 3: ✅ UPDATED Product_Name_Final_Merged with billing cycle aware logic
  CASE
    -- Anchor billing cycles: direct dimension lookup
    WHEN (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type <> 'NT' AND base.Billing_Cycle_Updated = 0) THEN
        COALESCE(merged_plans.Product_Name_Final_Merged, base.Product_Name_Final)
    -- All other billing cycles: inherit from anchor
    ELSE
        COALESCE(anchor.Anchor_Product_Name_Final_Merged, base.Product_Name_Final)
  END AS Product_Name_Final_Merged

FROM base

LEFT JOIN `variant-finance-data-project.Daedalus.Decline_Reason_Final` dr
  ON base.Decline_Reason = dr.Decline_Reason

LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` afid_dim
  ON base.AFID = afid_dim.AFID

LEFT JOIN (
  SELECT DISTINCT Country_Code
  FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID`
  WHERE Country_Code IS NOT NULL
) spend_dim
  ON base.Spend_Country_Code = spend_dim.Country_Code

LEFT JOIN `variant-finance-data-project.Sticky_Data.Dim_Country_Code` app_country_ip
  ON base.App_Name = app_country_ip.App_Name
  AND base.IP_Country_Code = app_country_ip.Country_Code

LEFT JOIN `variant-finance-data-project.Sticky_Data.Dim_Country_Code` app_country_ship
  ON base.App_Name = app_country_ship.App_Name
  AND base.Ship_Country = app_country_ship.Country_Code

LEFT JOIN `variant-finance-data-project.Sticky_Data.Dim_Country_Code` app_country_bill
  ON base.App_Name = app_country_bill.App_Name
  AND base.Bill_Country = app_country_bill.Country_Code

-- ✅ Anchor cycle join (only matches anchor rows for direct lookup)
LEFT JOIN `variant-finance-data-project.VPU.VPU_Dim_MergedPlansDetails` merged_plans
  ON base.Product_Name_Final = merged_plans.Product_Name_final
  AND base.Date_of_Sale >= merged_plans.Start_Date
  AND base.Date_of_Sale <= merged_plans.End_Date
  AND (
    (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
    OR (base.Trial_Type <> 'NT' AND base.Billing_Cycle_Updated = 0)
  )

-- ✅ ADDED: Non-anchor rows inherit from anchor via this join
LEFT JOIN Anchor_Product_Names anchor
  ON base.Updated_Cust_ID = anchor.Updated_Cust_ID
  AND base.Trial_Type = anchor.Trial_Type
  AND base.App_Name = anchor.App_Name
  AND NOT (
    (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
    OR (base.Trial_Type <> 'NT' AND base.Billing_Cycle_Updated = 0)
  )
