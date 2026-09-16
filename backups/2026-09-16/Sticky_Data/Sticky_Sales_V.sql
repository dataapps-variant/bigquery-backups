
CREATE OR REPLACE VIEW Sticky_Data.Sticky_Sales_V AS
WITH Prev_bc AS (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY concat(Updated_Cust_ID, Billing_Cycle_Updated) 
           ORDER BY Date_of_Sale
         ) AS rn
  FROM Sticky_Data.Sticky_Sales_V_W_EC cl
),
Next_bc AS (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY concat(Updated_Cust_ID, Billing_Cycle_Updated)
           ORDER BY Date_of_Sale
         ) AS rn
  FROM Sticky_Data.Sticky_Sales_V_W_EC cl
),

CL AS (
  SELECT * FROM Sticky_Data.Sticky_Sales_V_W_EC
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
    ELSE 31
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
                ELSE 31
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
            ELSE 31
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
  END AS Delay_Crystal_Ball

FROM CL_With_Joins CL
