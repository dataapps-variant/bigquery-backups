-- job_id: scheduled_query_6a7ecd77-0000-2fa5-bcfc-240588731210
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T10:45:06.725000+00:00
-- started: 2026-07-29T10:45:07.107000+00:00
-- ended: 2026-07-29T10:45:09.113000+00:00

-- =========================================================================
-- Script: CWC_App_AFID Table Creation
-- Purpose: Aggregate CWC_Main_Table at Report_date + Billing_Cycle + App_Name + AFID level
--          with cascading retention rates and conditional metrics
-- Target: variant-finance-data-project.CWC.CWC_App_AFID
-- =========================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.CWC.CWC_App_AFID` AS

WITH base_agg AS (
  -- Step 1: Aggregate source data at required grain
  SELECT
    Report_date,
    Billing_Cycle,
    App_Name,
    AFID,
    
    -- Aggregated Volume Metrics
    SUM(Subscription_users) AS Subscription_users,
    SUM(Subscription_value) AS Subscription_value,
    SUM(Rebill_users) AS Rebill_users,
    SUM(Rebill_value) AS Rebill_value,
    SUM(SS_Users) AS SS_Users,
    SUM(SS_Value) AS SS_Value,
    SUM(Recent_Spend) AS Recent_Spend,
    SUM(Recent_Users) AS Recent_Users,
    
    -- Refund metrics for later calculations
    SUM(Refund_ratio) AS Refund_Ratio_Sum,
    SUM(Refund_ratio * Rebill_value) AS Refund_Weighted_Sum,
    AVG(Refund_ratio) AS Avg_Refund_ratio
    
  FROM `variant-finance-data-project.CWC.CWC_Main_Table`
  GROUP BY 
    Report_date,
    Billing_Cycle,
    App_Name,
    AFID
),

with_churn AS (
  -- Step 2: Calculate Churn Rate
  SELECT
    *,
    CASE 
      WHEN Billing_Cycle = 0 THEN 0.00
      WHEN Billing_Cycle >= 1 AND Subscription_users > 0 
        THEN 1 - (Rebill_users / Subscription_users)
      ELSE NULL
    END AS Churn_rate,
  FROM base_agg
),

with_survival_rates AS (
  -- Step 3: Calculate survival rate (1 - Churn) for each BC
  SELECT
    *,
    CASE 
      WHEN Billing_Cycle >= 1 AND Churn_rate IS NOT NULL THEN 1 - Churn_rate
      ELSE NULL
    END AS Survival_rate
  FROM with_churn
),

with_retention AS (
  -- Step 3b: Calculate Cascading Retention using cumulative product of survival rates
  -- Retention at BC0 = 1.00
  -- Retention at BCn (n>=1) = Product of all survival rates from BC1 to BCn
  SELECT
    *,
    CASE 
      WHEN Billing_Cycle = 0 THEN 1.00
      WHEN Billing_Cycle >= 1 AND Survival_rate IS NOT NULL THEN 
        -- Calculate cumulative product: exp(sum(ln(survival_rates from BC1 to current BC)))
        EXP(
          SUM(LN(GREATEST(Survival_rate, 0.0001)))  -- Use GREATEST to avoid ln(0) or negative values
          OVER (
            PARTITION BY Report_date, App_Name, AFID 
            ORDER BY Billing_Cycle
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
          )
        )
      ELSE NULL
    END AS Retention_rate
  FROM with_survival_rates
),

with_metrics AS (
  -- Step 4: Calculate all derived metrics
  SELECT
    Report_date,
    Billing_Cycle,
    App_Name,
    AFID,
    Subscription_users,
    Subscription_value,
    Rebill_users,
    Rebill_value,
    SS_Users,
    SS_Value,
    Recent_Spend,
    Recent_Users,
    
    -- Simple calculations
    Recent_Spend / 7 AS T7D_Spend,
    Recent_Users / 7 AS T7D_Users,
    
    -- Rates
    Churn_rate,
    Retention_rate,
    
    -- Refund metrics
    Refund_Ratio_Sum AS Refund_Ratio,
    CASE 
      WHEN Rebill_value > 0 THEN Refund_Weighted_Sum / Rebill_value
      ELSE NULL
    END AS Wt_Avg_Refund_ratio,
    Avg_Refund_ratio,
    
    -- NET Retention
    Retention_rate - CASE 
      WHEN Rebill_value > 0 THEN Refund_Weighted_Sum / Rebill_value
      ELSE NULL
    END AS NET_Retention_rate,
    
    -- CAC
    CASE 
      WHEN Recent_Users > 0 THEN Recent_Spend / Recent_Users
      ELSE NULL
    END AS Recent_CAC,
    
    -- ARPU calculations
    CASE 
      WHEN Rebill_users > 0 
        THEN ((SS_Value + Rebill_value) / Rebill_users) * Retention_rate
      ELSE NULL
    END AS ARPU_Discounted,
    
    CASE 
      WHEN Rebill_users > 0 
        THEN ((SS_Value + Rebill_value) / Rebill_users) * 
             (Retention_rate - CASE 
                WHEN Rebill_value > 0 THEN Refund_Weighted_Sum / Rebill_value
                ELSE NULL
              END)
      ELSE NULL
    END AS Net_ARPU_Discounted
    
  FROM with_retention
),

with_ltv AS (
  -- Step 5: Calculate Net_LTV_Discounted
  SELECT
    *,
    Net_ARPU_Discounted - COALESCE(Recent_CAC, 0) AS Net_LTV_Discounted
  FROM with_metrics
),


bc4_check AS (
  -- Step 7: Get BC4 Net_ARPU_Discounted for each group
  SELECT
    Report_date,
    App_Name,
    AFID,
    Net_ARPU_Discounted AS BC4_Net_ARPU
  FROM with_ltv
  WHERE Billing_Cycle = 4
),

bc0_to_4_sum AS (
  -- Step 8: Sum Net_ARPU_Discounted from BC0 to BC4
  SELECT
    Report_date,
    App_Name,
    AFID,
    SUM(Net_ARPU_Discounted) AS Net_ARPU_Sum_BC0_to_4
  FROM with_ltv
  WHERE Billing_Cycle BETWEEN 0 AND 4
  GROUP BY Report_date, App_Name, AFID
)

-- Step 9: Final SELECT with Net_BC4_ARPU
SELECT
    wn.Report_date,
    wn.Billing_Cycle,
    wn.App_Name,
    wn.AFID,
    wn.Subscription_users,
    wn.Subscription_value,
    wn.Rebill_users,
    wn.Rebill_value,
    wn.SS_Users,
    wn.SS_Value,
    wn.Recent_Spend,
    wn.Recent_Users,
    wn.T7D_Spend,
    wn.T7D_Users,
   wn.Recent_CAC,
    wn.Churn_rate,
    wn.Retention_rate,
    wn.Refund_Ratio,
    wn.Wt_Avg_Refund_ratio,
    wn.Avg_Refund_ratio,
    wn.NET_Retention_rate,
    wn.ARPU_Discounted,
    wn.Net_ARPU_Discounted,
    wn.Net_LTV_Discounted,
    
    -- Net_BC4_ARPU calculation
    CASE
  WHEN wn.Billing_Cycle = 4 AND bc4.BC4_Net_ARPU > 0 THEN sum4.Net_ARPU_Sum_BC0_to_4
  ELSE NULL
END AS Net_BC4_ARPU
    
FROM with_ltv wn
LEFT JOIN bc4_check bc4
  ON wn.Report_date = bc4.Report_date
  AND wn.App_Name = bc4.App_Name
  AND wn.AFID = bc4.AFID
LEFT JOIN bc0_to_4_sum sum4
  ON wn.Report_date = sum4.Report_date
  AND wn.App_Name = sum4.App_Name
  AND wn.AFID = sum4.AFID
ORDER BY 
  Report_date,
  App_Name,
  AFID,
  Billing_Cycle;

-- =========================================================================
-- End of Script
-- =========================================================================
