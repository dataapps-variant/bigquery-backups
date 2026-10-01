/* ============================================================================
   Sticky_data_API_original_V_Merged_TBL  --  v3, resubscriber logic on Bill_Email

   WHAT CHANGED FROM v2 (in plain words)
   ----------------------------------------------------------------------------
   1. The customer is now identified by email, not Customer_Number.
        Person = App_Name + Bill_Email (lowercased, trimmed)
      If a run's email is blank, it falls back to Customer_Number
      (shown as 'CN_<number>') so those rows are not lost.

   2. A return only counts as a resubscribe if it is on the SAME plan.
        Person = App_Name + Bill_Email + Product_Name_Final_Merged
      Same email coming back on a different plan = a new customer on that plan
      (their own run 1), not a resubscriber.

   3. Each run (subscription chain = Ancestor_Order_Id) takes the email and the
      merged plan name of its anchor order (NT BC1 / non-NT BC0). So if someone
      changes their email mid-run, the whole run still stays together.

   Everything else is the same as v2:
     - All old columns are untouched (same names, same formulas).
     - Billing_Cycle_Lifetime logic is the same: run 1 keeps its BC; a return
       is placed by days since the person's first acquisition, then counts up
       one by one. If it lands on a BC they already have, it moves to the next
       free one.

   NEW / CHANGED COLUMNS
     Resub_Email_Key      the email used to match (or 'CN_<number>' fallback)
     Resub_Product        the merged plan name used to match
     Run_Key              the subscription chain (Ancestor_Order_Id)
     Subscription_Run_ID  1 = first time on this plan, 2 = first return, ...
     Total_Subscription_Runs
     Is_Resubscriber      this email has 2+ runs on this plan
     Is_Resubscribe_Run   this order belongs to run 2 or later
     Run_First_Date, Run_Gap_Days, First_Acq_Date, Days_Since_First_Acquisition,
     Grid_Cycle_Days, Run_Start_LBC, Billing_Cycle_Lifetime
   ============================================================================ */

CREATE OR REPLACE TABLE Sticky_Data.Sticky_data_API_original_V_Merged_TBL_1 AS

WITH
/* ===== UNCHANGED FROM THE ORIGINAL ===================================== */

Prev_bc AS (
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
    Refund_Amount, Refund_Date, Bill_First, Bill_Last, Bill_Address1,
    Bill_Address2, Bill_City, Bill_State, Bill_Zip, Bill_Phone, Ship_First,
    Ship_Last, Ship_Address1, Ship_Address2, Ship_City, Ship_State, Ship_Zip,
    Ship_Method_Name, Ship_Price, Tracking_Number, Credit_Card_Number,
    Credit_Card_Expiration, Prepaid_Match, Processor_Id, Retry_Date,
    Auth_Number, SID, AFFID, C1, C2, C3, AID, OPT, Rebill_Discount,
    Blacklisted, Product_Name_Final_Merged
  ),
  SAFE_CAST(Refund_Amount AS FLOAT64) AS Refund_Amount,
  DATE(SAFE_CAST(Refund_Date AS DATETIME)) AS Refund_Date
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
),

/* ===== NEW: RESUBSCRIBER LAYER (EMAIL + SAME PLAN) ===================== */

/* Only good orders, so declines cannot create fake runs. */
Person_Src AS (
  SELECT
    App_Name,
    Customer_Number,
    LOWER(TRIM(Bill_Email)) AS Email_Clean,
    Order_Id,
    Date_of_Sale,
    Trial_Type,
    Trial_Period,
    Billing_Cycle_Updated,
    Product_Name_Final,
    COALESCE(NULLIF(TRIM(Ancestor_Order_Id), ''), Updated_Cust_ID) AS Run_Key
  FROM Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL
  WHERE Final_Order_Status IN (2, 6, 8)
),

/* Anchor order of each run (NT BC1 / non-NT BC0; else the earliest order).
   The run takes its email, plan and trial details from this order.        */
Run_Anchor_Rows AS (
  SELECT * EXCEPT(rn)
  FROM (
    SELECT
      App_Name,
      Run_Key,
      Customer_Number,
      Email_Clean,
      Date_of_Sale       AS Anchor_Date,
      Trial_Type         AS Anchor_Trial_Type,
      Trial_Period       AS Anchor_Trial_Period,
      Product_Name_Final AS Anchor_Product_Name_Final,
      ROW_NUMBER() OVER (
        PARTITION BY App_Name, Run_Key
        ORDER BY
          CASE WHEN (Trial_Type =  'NT' AND Billing_Cycle_Updated = 1)
                 OR (Trial_Type <> 'NT' AND Billing_Cycle_Updated = 0)
               THEN 0 ELSE 1 END,
          Date_of_Sale, Order_Id
      ) AS rn
    FROM Person_Src
  )
  WHERE rn = 1
),

/* Merged plan name of each run's anchor order (one row per run). */
Run_Identity AS (
  SELECT * EXCEPT(rn)
  FROM (
    SELECT
      a.*,
      COALESCE(NULLIF(a.Email_Clean, ''), CONCAT('CN_', a.Customer_Number))  AS Resub_Email_Key,
      COALESCE(mp.Product_Name_Final_Merged, a.Anchor_Product_Name_Final)    AS Resub_Product,
      ROW_NUMBER() OVER (
        PARTITION BY a.App_Name, a.Run_Key
        ORDER BY mp.Start_Date DESC
      ) AS rn
    FROM Run_Anchor_Rows a
    LEFT JOIN `variant-finance-data-project.VPU.VPU_Dim_MergedPlansDetails` mp
      ON  a.Anchor_Product_Name_Final = mp.Product_Name_final
      AND a.Anchor_Date >= mp.Start_Date
      AND a.Anchor_Date <= mp.End_Date
  )
  WHERE rn = 1
),

/* One row per run: dates and BC range. */
Runs AS (
  SELECT
    s.App_Name,
    s.Run_Key,
    i.Resub_Email_Key,
    i.Resub_Product,
    MIN(s.Date_of_Sale)          AS Run_First_Date,
    MAX(s.Date_of_Sale)          AS Run_Last_Date,
    MIN(s.Billing_Cycle_Updated) AS Run_Min_BC,
    MAX(s.Billing_Cycle_Updated) AS Run_Max_BC
  FROM Person_Src s
  JOIN Run_Identity i
    ON s.App_Name = i.App_Name AND s.Run_Key = i.Run_Key
  GROUP BY 1, 2, 3, 4
),

/* Number the runs for each person = App + Email + Plan. */
Run_Seq AS (
  SELECT
    *,
    DENSE_RANK() OVER w_ord AS Subscription_Run_ID,
    COUNT(*)            OVER w_all AS Total_Subscription_Runs,
    MIN(Run_First_Date) OVER w_all AS First_Acq_Date,
    LAG(Run_Last_Date)  OVER w_ord AS Prev_Run_Last_Date
  FROM Runs
  WINDOW
    w_all AS (PARTITION BY App_Name, Resub_Email_Key, Resub_Product),
    w_ord AS (PARTITION BY App_Name, Resub_Email_Key, Resub_Product
              ORDER BY Run_First_Date, Run_Key)
),

/* Run 1's plan sets the BC grid for every later run of that person. */
First_Acq AS (
  SELECT
    s.App_Name,
    s.Resub_Email_Key,
    s.Resub_Product,
    i.Anchor_Trial_Type                                      AS First_Acq_Trial_Type,
    COALESCE(SAFE_CAST(i.Anchor_Trial_Period AS INT64), 0)   AS First_Acq_Trial_Period,
    GREATEST(COALESCE(SAFE_CAST(pm.`Delay days` AS INT64), 31), 1) AS Grid_Cycle_Days
  FROM Run_Seq s
  JOIN Run_Identity i
    ON s.App_Name = i.App_Name AND s.Run_Key = i.Run_Key
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` pm
    ON i.Anchor_Product_Name_Final = pm.`Plan Name`
  WHERE s.Subscription_Run_ID = 1
),

/* Place each run's first order on the lifetime BC grid. */
Run_Snap AS (
  SELECT
    s.*,
    f.Grid_Cycle_Days,
    DATE_DIFF(s.Run_First_Date, s.First_Acq_Date, DAY) AS Run_Start_Elapsed_Days,
    CASE WHEN s.Prev_Run_Last_Date IS NOT NULL
         THEN DATE_DIFF(s.Run_First_Date, s.Prev_Run_Last_Date, DAY)
    END AS Run_Gap_Days,
    CASE
      WHEN s.Subscription_Run_ID = 1
        THEN s.Run_Min_BC

      -- first acquisition had no trial: BC1 at day 0, BCn at (n-1) x cycle
      WHEN f.First_Acq_Trial_Type = 'NT'
        THEN DIV(GREATEST(DATE_DIFF(s.Run_First_Date, s.First_Acq_Date, DAY), 0),
                 f.Grid_Cycle_Days) + 1

      -- first acquisition had a trial: BC0 at day 0, BC1 at trial+1,
      -- BCn at trial + 1 + (n-1) x cycle
      WHEN DATE_DIFF(s.Run_First_Date, s.First_Acq_Date, DAY)
             < f.First_Acq_Trial_Period + 1
        THEN 0

      ELSE DIV(DATE_DIFF(s.Run_First_Date, s.First_Acq_Date, DAY)
                 - f.First_Acq_Trial_Period - 1,
               f.Grid_Cycle_Days) + 1
    END AS Run_Start_LBC_Unfloored
  FROM Run_Seq s
  JOIN First_Acq f
    ON  s.App_Name        = f.App_Name
    AND s.Resub_Email_Key = f.Resub_Email_Key
    AND s.Resub_Product   = f.Resub_Product
),

/* Never reuse a BC the person already has. */
Run_Final AS (
  SELECT
    *,
    CASE
      WHEN Subscription_Run_ID = 1 THEN Run_Start_LBC_Unfloored
      ELSE GREATEST(
             Run_Start_LBC_Unfloored,
             COALESCE(
               MAX(Run_Start_LBC_Unfloored + (Run_Max_BC - Run_Min_BC)) OVER (
                 PARTITION BY App_Name, Resub_Email_Key, Resub_Product
                 ORDER BY Subscription_Run_ID
                 ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
               ), -1) + 1
           )
    END AS Run_Start_LBC
  FROM Run_Snap
)

/* ===== FINAL SELECT ==================================================== */

SELECT
  CL.*,

  /* ---- resubscriber columns ---- */
  rf.Resub_Email_Key,
  rf.Resub_Product,
  rf.Run_Key,
  rf.Subscription_Run_ID,
  rf.Total_Subscription_Runs,
  (rf.Total_Subscription_Runs > 1)  AS Is_Resubscriber,
  (rf.Subscription_Run_ID   > 1)    AS Is_Resubscribe_Run,
  rf.Run_First_Date,
  rf.Run_Gap_Days,
  rf.First_Acq_Date,
  DATE_DIFF(CL.Date_of_Sale, rf.First_Acq_Date, DAY) AS Days_Since_First_Acquisition,
  rf.Grid_Cycle_Days,
  rf.Run_Start_LBC,
  rf.Run_Start_LBC + (CL.Billing_Cycle_Updated - rf.Run_Min_BC) AS Billing_Cycle_Lifetime,

  /* ---- everything below is unchanged ---- */
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

  CASE
    WHEN (CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
         OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0) THEN
      COALESCE(merged_plans.Product_Name_Final_Merged, CL.Product_Name_Final)
    ELSE
      COALESCE(anchor.Anchor_Product_Name_Final_Merged, CL.Product_Name_Final)
  END AS Product_Name_Final_Merged

FROM CL_With_Joins CL

LEFT JOIN Run_Final rf
  ON  CL.App_Name = rf.App_Name
  AND COALESCE(NULLIF(TRIM(CL.Ancestor_Order_Id), ''), CL.Updated_Cust_ID) = rf.Run_Key

LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` plan_map
  ON CL.Product_Name_Final = plan_map.`Plan Name`

LEFT JOIN `variant-finance-data-project.VPU.VPU_Dim_MergedPlansDetails` merged_plans
  ON CL.Product_Name_Final = merged_plans.Product_Name_final
  AND CL.Date_of_Sale >= merged_plans.Start_Date
  AND CL.Date_of_Sale <= merged_plans.End_Date
  AND ((CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
       OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0))

LEFT JOIN Anchor_Product_Names anchor
  ON CL.Updated_Cust_ID = anchor.Updated_Cust_ID
  AND CL.Trial_Type = anchor.Trial_Type
  AND CL.App_Name = anchor.App_Name
  AND NOT ((CL.Trial_Type = 'NT' AND CL.Billing_Cycle_Updated = 1)
           OR (CL.Trial_Type <> 'NT' AND CL.Billing_Cycle_Updated = 0))

WHERE CL.Final_Order_Status IN (2, 6, 8);


/* ============================================================================
   QUICK CHECKS AFTER THE BUILD  (run one at a time; each should return 0)
   ============================================================================

-- 1. Row count must match the live table
SELECT
  (SELECT COUNT(*) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL_2`)
- (SELECT COUNT(*) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`) AS row_diff;

-- 2. Run 1 must keep its original BC
SELECT COUNT(*) AS run1_moved
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL_2`
WHERE Subscription_Run_ID = 1 AND Billing_Cycle_Lifetime <> Billing_Cycle_Updated;

-- 3. No person (email + plan) holds the same lifetime BC twice
SELECT COUNT(*) AS duplicate_bcs FROM (
  SELECT App_Name, Resub_Email_Key, Resub_Product, Billing_Cycle_Lifetime
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL_2`
  GROUP BY 1, 2, 3, 4
  HAVING COUNT(*) > 1
);

-- 4. Every row got a run
SELECT COUNT(*) AS no_run
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL_2`
WHERE Run_Key IS NULL OR Billing_Cycle_Lifetime IS NULL;

-- 5. Resubscriber count per app (email + same plan)
SELECT
  App_Name,
  COUNT(DISTINCT IF(Is_Resubscriber, CONCAT(Resub_Email_Key, '|', Resub_Product), NULL)) AS resubscribers,
  COUNTIF(Is_Resubscribe_Run) AS resubscribe_orders,
  MAX(Total_Subscription_Runs) AS max_runs
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL_2`
GROUP BY 1
ORDER BY resubscribers DESC;

   ============================================================================ */
