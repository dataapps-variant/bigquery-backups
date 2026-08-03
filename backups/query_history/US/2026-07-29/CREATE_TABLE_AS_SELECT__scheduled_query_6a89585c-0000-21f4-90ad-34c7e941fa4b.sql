-- job_id: scheduled_query_6a89585c-0000-21f4-90ad-34c7e941fa4b
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T21:08:02.844000+00:00
-- started: 2026-07-29T21:08:03.400000+00:00
-- ended: 2026-07-29T21:08:10.184000+00:00

CREATE OR REPLACE TABLE Sticky_Data.Sticky_data_API_original_V_Merged_TBL AS---for json apps Merged data 
WITH Prev_bc AS (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY concat(Updated_Cust_ID, Billing_Cycle_Updated) 
           ORDER BY Date_of_Sale
         ) AS rn
  FROM Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL cl
),
Next_bc AS (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY concat(Updated_Cust_ID, Billing_Cycle_Updated)
           ORDER BY Date_of_Sale
         ) AS rn
  FROM Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL cl
),

CL AS (
  SELECT * EXCEPT(
    Refund_Amount, 
    Refund_Date,
    Bill_First,
    Bill_Last,
    Bill_Address1,
    Bill_Address2,
    Bill_City,
    Bill_State,
    Bill_Zip,
    Bill_Phone,
    Ship_First,
    Ship_Last,
    Ship_Address1,
    Ship_Address2,
    Ship_City,
    Ship_State,
    Ship_Zip,
    Ship_Method_Name,
    Ship_Price,
    Tracking_Number,
    Credit_Card_Number,
    Credit_Card_Expiration,
    Prepaid_Match,
    Processor_Id,
    Retry_Date,
    Auth_Number,
    Hold_Date,
    SID,
    AFFID,
    C1,
    C2,
    C3,
    AID,
    OPT,
    Rebill_Discount,
    Blacklisted,
    Product_Name_Final_Merged
  ),
  SAFE_CAST(Refund_Amount AS FLOAT64) AS Refund_Amount,
  DATE(SAFE_CAST(Refund_Date AS DATETIME)) AS Refund_Date  -- Extract just the date part
  FROM Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL
),
CL_With_Joins AS (
  SELECT 
    CL.*,
    Prev.Date_of_Sale AS Prev_Date_of_Sale,
    Next.Date_of_Sale AS Next_Date_of_Sale
  FROM CL
  LEFT JOIN Prev_bc Prev
    ON CL.Updated_Cust_ID = PREV.Updated_Cust_ID
   AND Prev.Billing_Cycle_Updated = CL.Billing_Cycle_Updated - 1
   AND Prev.rn = 1
  LEFT JOIN Next_bc Next
    ON CL.Updated_Cust_ID = NEXT.Updated_Cust_ID 
   AND Next.Billing_Cycle_Updated = CL.Billing_Cycle_Updated + 1
   AND Next.rn = 1
),
-- FIXED CTE: Get Product_Name_Final_Merged for anchor billing cycles with deduplication
Anchor_Product_Names AS (
  SELECT 
    Updated_Cust_ID,
    Trial_Type,
    App_Name,
    Anchor_Product_Name_Final_Merged
  FROM (
    SELECT 
      CL.Updated_Cust_ID,
      CL.Trial_Type,
      CL.App_Name,
      COALESCE(merged_plans.Product_Name_Final_Merged, CL.Product_Name_Final) AS Anchor_Product_Name_Final_Merged,
      ROW_NUMBER() OVER (
        PARTITION BY CL.Updated_Cust_ID 
        ORDER BY CL.Date_of_Sale, CL.Order_Id
      ) AS rn
    FROM CL_With_Joins CL
    LEFT JOIN `variant-finance-data-project.VPU.VPU_Dim_MergedPlansDetails` merged_plans
      ON CL.Product_Name_Final = merged_plans.Product_Name_final
      AND CL.Date_of_Sale >= merged_plans.Start_Date
      AND CL.Date_of_Sale <= merged_plans.End_Date
    WHERE 
      (CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
      OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0)
  ) ranked
  WHERE rn = 1
)
SELECT
  CL.*,

  30 AS Reg_BC_Period,

CASE 
    WHEN CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1 THEN CL.Date_of_Sale
    WHEN CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0 THEN CL.Date_of_Sale
    ELSE CL.Prev_Date_of_Sale
END AS Privious_BC_date_SOT,

DATE_DIFF(
    CL.Date_Of_Sale,
    CASE 
        WHEN CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1 THEN CL.Date_of_Sale
        WHEN CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0 THEN CL.Date_of_Sale
        ELSE CL.Prev_Date_of_Sale
    END,
    DAY
) AS Actual_BC_days_SOT,

CASE 
    WHEN (CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
         OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0) THEN 0
    WHEN CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 1 THEN CL.Trial_Period + 1
    ELSE COALESCE(plan_map.`Delay days`, 31)
END AS Expected_BC_days_SOT,

CASE 
    WHEN (DATE_DIFF(
            CL.Date_Of_Sale,
            CASE 
                WHEN CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1 THEN CL.Date_of_Sale
                WHEN CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0 THEN CL.Date_of_Sale
                ELSE CL.Prev_Date_of_Sale
            END,
            DAY
          )
          - CASE 
                WHEN (CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
                     OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0) THEN 0
                WHEN CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 1 THEN CL.Trial_Period + 1
                ELSE COALESCE(plan_map.`Delay days`, 31)
            END
        ) = -1 
    THEN 0
    ELSE (
        DATE_DIFF(
            CL.Date_Of_Sale,
            CASE 
                WHEN CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1 THEN CL.Date_of_Sale
                WHEN CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0 THEN CL.Date_of_Sale
                ELSE CL.Prev_Date_of_Sale
            END,
            DAY
        )
        - CASE 
            WHEN (CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
                 OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0) THEN 0
            WHEN CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 1 THEN CL.Trial_Period + 1
            ELSE COALESCE(plan_map.`Delay days`, 31)
        END
    )
END AS Delay_days_SOT,

  CL.Next_Date_of_Sale AS Next_BC_date_Actual,

  DATE_ADD(
    CL.Date_Of_Sale,
    INTERVAL (
      CASE 
        WHEN CL.Billing_Cycle_Updated = 0 AND CL.Trial_Type <> 'NT' THEN CL.Trial_Period
        ELSE 30
      END + 1
    ) DAY
  ) AS Next_BC_Date_Calculated,

  CASE 
    WHEN DATE_DIFF(
      CL.Next_Date_of_Sale,
      DATE_ADD(
        CL.Date_Of_Sale,
        INTERVAL (
          CASE 
            WHEN CL.Billing_Cycle_Updated = 0 AND CL.Trial_Type <> 'NT' THEN CL.Trial_Period
            ELSE 30
          END + 1
        ) DAY
      ),
      DAY
    ) = -1 THEN 0
    ELSE DATE_DIFF(
      CL.Next_Date_of_Sale,
      DATE_ADD(
        CL.Date_Of_Sale,
        INTERVAL (
          CASE 
            WHEN CL.Billing_Cycle_Updated = 0 AND CL.Trial_Type <> 'NT' THEN CL.Trial_Period
            ELSE 30
          END + 1
        ) DAY
      ),
      DAY
    )
  END AS Delay_Crystal_Ball,

  -- UPDATED COLUMN: Product_Name_Final_Merged with new logic
  CASE 
    -- For anchor billing cycles (NT BC=1 or YT BC=0), use dimension table lookup
    WHEN (CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
         OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0) THEN
      COALESCE(merged_plans.Product_Name_Final_Merged, CL.Product_Name_Final)
    -- For all other billing cycles, inherit from anchor billing cycle
    ELSE 
      COALESCE(anchor.Anchor_Product_Name_Final_Merged, CL.Product_Name_Final)
  END AS Product_Name_Final_Merged

FROM CL_With_Joins CL

LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` plan_map
  ON CL.Product_Name_Final = plan_map.`Plan Name`
-- Join for anchor billing cycles only (used when current record is anchor)
LEFT JOIN `variant-finance-data-project.VPU.VPU_Dim_MergedPlansDetails` merged_plans
  ON CL.Product_Name_Final = merged_plans.Product_Name_final
  AND CL.Date_of_Sale >= merged_plans.Start_Date
  AND CL.Date_of_Sale <= merged_plans.End_Date
  AND ((CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
       OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0))
-- Join to get anchor product name for non-anchor billing cycles
LEFT JOIN Anchor_Product_Names anchor
  ON CL.Updated_Cust_ID = anchor.Updated_Cust_ID
  AND CL.Trial_Type = anchor.Trial_Type
  AND CL.App_Name = anchor.App_Name
  AND NOT ((CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
           OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0))

WHERE CL.Final_Order_Status IN (2, 6, 8)
