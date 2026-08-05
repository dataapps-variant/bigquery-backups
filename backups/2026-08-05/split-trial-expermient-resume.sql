CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.split-trial-expermient-resume` AS

WITH ref_users AS (
  SELECT
    Category,
    user_id
  FROM `variant-finance-data-project.Sticky_Data.split-trial-expermient-resume-user-list`
  WHERE user_id IS NOT NULL
),

-- Col 3: Initial Trial Conversions
initial_trial AS (
  SELECT
    r.Category,
    COUNT(DISTINCT s.Updated_Cust_ID) AS Initial_Trial_Conversions
  FROM ref_users r
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` s
    ON r.user_id = s.Bill_Email
  WHERE s.App_Name = 'JF'
    AND s.Billing_Cycle_Updated = 0
    AND s.Date_of_Sale BETWEEN '2026-03-30' AND '2026-04-27'
    AND s.Product_Name_Final IN ('JF2995AA', 'JF2995AF', 'JF2995PT', 'JF2995ST')
    AND s.Final_Order_Status != 7
  GROUP BY r.Category
),

-- Two_BC0_Users and Three_BC0_Users base
bc0_email_cust_counts AS (
  SELECT
    r.Category,
    s.Bill_Email,
    COUNT(DISTINCT s.Updated_Cust_ID) AS Cust_ID_Count
  FROM ref_users r
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` s
    ON r.user_id = s.Bill_Email
  WHERE s.App_Name = 'JF'
    AND s.Billing_Cycle_Updated = 0
    AND s.Date_of_Sale BETWEEN '2026-03-30' AND '2026-04-27'
    AND s.Product_Name_Final IN ('JF2995AA', 'JF2995AF', 'JF2995PT', 'JF2995ST')
    AND s.Final_Order_Status != 7
  GROUP BY r.Category, s.Bill_Email
),

-- Two_BC0_Users
two_bc0_users AS (
  SELECT
    Category,
    COUNT(Bill_Email) AS Two_BC0_Users
  FROM bc0_email_cust_counts
  WHERE Cust_ID_Count = 2
  GROUP BY Category
),

-- Three_BC0_Users
three_bc0_users AS (
  SELECT
    Category,
    COUNT(Bill_Email) AS Three_BC0_Users
  FROM bc0_email_cust_counts
  WHERE Cust_ID_Count = 3
  GROUP BY Category
),

-- Col 4: Trial Refunds
trial_refunds AS (
  SELECT
    r.Category,
    COUNT(DISTINCT s.Updated_Cust_ID) AS Trial_Refunds
  FROM ref_users r
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` s
    ON r.user_id = s.Bill_Email
  WHERE s.App_Name = 'JF'
    AND s.Billing_Cycle_Updated = 0
    AND s.Date_of_Sale BETWEEN '2026-03-30' AND '2026-04-27'
    AND (UPPER(s.Is_Refund) = 'YES' OR s.Is_Chargeback = '1')
    AND s.Product_Name_Final IN ('JF2995AA', 'JF2995AF', 'JF2995PT', 'JF2995ST')
  GROUP BY r.Category
),

-- Base: Initial Converted Users (reusable for cols 5, 6, 7)
initial_converted_base AS (
  SELECT
    r.Category,
    s.Updated_Cust_ID,
    s.Bill_Email,
    s.Date_of_Sale,
    s.Trial_Period,
    s.Final_Order_Status,
    s.Is_Recurring,
    SAFE.PARSE_DATE('%Y-%m-%d', s.Hold_Date) AS Hold_Date_Parsed
  FROM ref_users r
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` s
    ON r.user_id = s.Bill_Email
  WHERE s.App_Name = 'JF'
    AND s.Billing_Cycle_Updated = 0
    AND s.Date_of_Sale BETWEEN '2026-03-30' AND '2026-04-27'
    AND s.Product_Name_Final IN ('JF2995AA', 'JF2995AF', 'JF2995PT', 'JF2995ST')
    AND s.Final_Order_Status != 7
),

-- Users who have ANY BC1 transaction from 2026-03-30 onwards (for exclusion in col 5)
users_with_bc1 AS (
  SELECT DISTINCT
    Updated_Cust_ID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  WHERE Billing_Cycle_Updated = 1
    AND Date_of_Sale >= '2026-03-30'
),

-- Col 5: In Trial Cancellations
in_trial_cancellations AS (
  SELECT
    ic.Category,
    COUNT(DISTINCT ic.Updated_Cust_ID) AS In_Trial_Cancellations
  FROM initial_converted_base ic
  LEFT JOIN users_with_bc1 bc1
    ON ic.Updated_Cust_ID = bc1.Updated_Cust_ID
  WHERE ic.Final_Order_Status = 2
    AND ic.Is_Recurring = '0'
    AND ic.Hold_Date_Parsed <= DATE_ADD(ic.Date_of_Sale, INTERVAL ic.Trial_Period - 1 DAY)
    AND bc1.Updated_Cust_ID IS NULL
  GROUP BY ic.Category
),

-- BC1+ transactions for Post_Trial_Cancellations
bc1_dates AS (
  SELECT
    Updated_Cust_ID,
    Date_of_Sale AS BC1_Date_of_Sale,
    Final_Order_Status,
    Is_Recurring
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  WHERE Billing_Cycle_Updated > 0
    AND Date_of_Sale >= '2026-03-30'
),

-- Post Trial Cancellations
post_trial_bc1_cancellations AS (
  SELECT
    ic.Category,
    COUNT(DISTINCT ic.Updated_Cust_ID) AS Post_Trial_Cancellations
  FROM initial_converted_base ic
  JOIN bc1_dates bd
    ON ic.Updated_Cust_ID = bd.Updated_Cust_ID
  WHERE bd.Final_Order_Status = 2
    AND bd.Is_Recurring = '0'
  GROUP BY ic.Category
),

-- Col 8: Unique BC1 Attempts Per User
unique_bc1_attempts AS (
  SELECT
    r.Category,
    COUNT(DISTINCT s.Updated_Cust_ID) AS Unique_BC1_Attempts_Per_User
  FROM ref_users r
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` s
    ON r.user_id = s.Bill_Email
  WHERE s.App_Name = 'JF'
    AND s.Billing_Cycle_Updated = 1
    AND DATE(SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', s.Acquisition_Date_Time)) BETWEEN '2026-03-30' AND '2026-04-27'
    AND s.Product_Name_Final IN ('JF2995AA', 'JF2995AF', 'JF2995PT', 'JF2995ST')
  GROUP BY r.Category
),

-- Base BC1 CTE (cols 9, 10, 11, 13, 14, 15 all share same base filter)
bc1_base AS (
  SELECT
    r.Category,
    s.Updated_Order_ID,
    s.Final_Order_Status,
    s.Is_Refund,
    s.Is_Chargeback,
    s.Retry_Attempt
  FROM ref_users r
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` s
    ON r.user_id = s.Bill_Email
  WHERE s.App_Name = 'JF'
    AND s.Billing_Cycle_Updated = 1
    AND DATE(SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', s.Acquisition_Date_Time)) BETWEEN '2026-03-30' AND '2026-04-27'
    AND s.Product_Name_Final IN ('JF2995AA', 'JF2995AF', 'JF2995PT', 'JF2995ST')
),

-- Col 9: Total BC1 Attempts
total_bc1_attempts AS (
  SELECT
    Category,
    COUNT(DISTINCT Updated_Order_ID) AS Total_BC1_Attempts
  FROM bc1_base
  GROUP BY Category
),

-- Col 10: BC1 Rebill Successes (raw count)
bc1_rebill_successes AS (
  SELECT
    Category,
    COUNT(DISTINCT Updated_Order_ID) AS BC1_Rebill_Successes_Raw
  FROM bc1_base
  WHERE Final_Order_Status != 7
  GROUP BY Category
),

-- Col 11: BC1 Rebill Failures (raw count)
bc1_rebill_failures AS (
  SELECT
    Category,
    COUNT(DISTINCT Updated_Order_ID) AS BC1_Rebill_Failures_Raw
  FROM bc1_base
  WHERE Final_Order_Status = 7
  GROUP BY Category
),

-- Col 13: BC1 Rebill Refunds
bc1_rebill_refunds AS (
  SELECT
    Category,
    COUNT(DISTINCT Updated_Order_ID) AS BC1_Rebill_Refunds
  FROM bc1_base
  WHERE UPPER(Is_Refund) = 'YES' OR UPPER(Is_Chargeback) = '1'
  GROUP BY Category
),

-- Col 14: Rebill Successes on Natural (First) Attempt
rebill_success_natural AS (
  SELECT
    Category,
    COUNT(DISTINCT Updated_Order_ID) AS Rebill_Successes_Natural
  FROM bc1_base
  WHERE Final_Order_Status != 7
    AND Retry_Attempt = '0'
  GROUP BY Category
),

-- Col 15: Rebill Failures on Natural (First) Attempt
rebill_failure_natural AS (
  SELECT
    Category,
    COUNT(DISTINCT Updated_Order_ID) AS Rebill_Failures_Natural
  FROM bc1_base
  WHERE Final_Order_Status = 7
    AND Retry_Attempt = '0'
  GROUP BY Category
),

-- Net_BC1_ARPU base
net_bc1_arpu AS (
  SELECT
    ic.Category,
    SAFE_DIVIDE(
      SUM(s.Order_Price_Net_of_Tax_USD),
      MAX(it.Initial_Trial_Conversions)
    ) AS Net_BC1_ARPU
  FROM initial_converted_base ic
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` s
    ON ic.Updated_Cust_ID = s.Updated_Cust_ID
  JOIN initial_trial it
    ON ic.Category = it.Category
  WHERE s.Final_Order_Status = 2
    AND s.Billing_Cycle_Updated <= 1
    AND s.Date_of_Sale >= '2026-03-30'
    AND s.App_Name = 'JF'
    AND s.Product_Name_Final IN ('JF2995AA', 'JF2995AF', 'JF2995PT', 'JF2995ST')
  GROUP BY ic.Category
)

-- Final SELECT
SELECT
  r.Category                                                                                           AS `Group`,
  CAST(NULL AS INT64)                                                                                  AS Unique_Paywall_Visits,
  COALESCE(it.Initial_Trial_Conversions, 0)                                                           AS Initial_Trial_Conversions,
  COALESCE(tb2.Two_BC0_Users, 0)                                                                      AS Two_BC0_Users,
  COALESCE(tb3.Three_BC0_Users, 0)                                                                    AS Three_BC0_Users,
  COALESCE(tr.Trial_Refunds, 0)                                                                       AS Trial_Refunds,
  COALESCE(itc.In_Trial_Cancellations, 0)                                                             AS In_Trial_Cancellations,
  COALESCE(ptb1.Post_Trial_Cancellations, 0)                                                          AS Post_Trial_Cancellations,
  COALESCE(ub.Unique_BC1_Attempts_Per_User, 0)                                                        AS Unique_BC1_Attempts_Per_User,
  COALESCE(tb.Total_BC1_Attempts, 0)                                                                  AS Total_BC1_Attempts,
  COALESCE(bs.BC1_Rebill_Successes_Raw, 0)                                                            AS BC1_Rebill_Successes_Count,
  SAFE_DIVIDE(COALESCE(bs.BC1_Rebill_Successes_Raw, 0), NULLIF(COALESCE(it.Initial_Trial_Conversions, 0), 0)) AS BC1_Rebill_Successes_Rate,
  COALESCE(bf.BC1_Rebill_Failures_Raw, 0)                                                             AS BC1_Rebill_Failures_Count,
  1 - SAFE_DIVIDE(COALESCE(bs.BC1_Rebill_Successes_Raw, 0), NULLIF(COALESCE(it.Initial_Trial_Conversions, 0), 0)) AS BC1_Rebill_Failures_Rate,
  COALESCE(br.BC1_Rebill_Refunds, 0)                                                                  AS BC1_Rebill_Refunds,
  COALESCE(rn.Rebill_Successes_Natural, 0)                                                            AS Rebill_Successes_Natural_Attempt,
  COALESCE(rf.Rebill_Failures_Natural, 0)                                                             AS Rebill_Failures_Natural_Attempt,
  COALESCE(arpu.Net_BC1_ARPU, 0)                                                                      AS Net_BC1_ARPU
FROM (SELECT DISTINCT Category FROM ref_users) r
LEFT JOIN initial_trial                it    ON r.Category = it.Category
LEFT JOIN two_bc0_users                tb2   ON r.Category = tb2.Category
LEFT JOIN three_bc0_users              tb3   ON r.Category = tb3.Category
LEFT JOIN trial_refunds                tr    ON r.Category = tr.Category
LEFT JOIN in_trial_cancellations       itc   ON r.Category = itc.Category
LEFT JOIN post_trial_bc1_cancellations ptb1  ON r.Category = ptb1.Category
LEFT JOIN unique_bc1_attempts          ub    ON r.Category = ub.Category
LEFT JOIN total_bc1_attempts           tb    ON r.Category = tb.Category
LEFT JOIN bc1_rebill_successes         bs    ON r.Category = bs.Category
LEFT JOIN bc1_rebill_failures          bf    ON r.Category = bf.Category
LEFT JOIN bc1_rebill_refunds           br    ON r.Category = br.Category
LEFT JOIN rebill_success_natural       rn    ON r.Category = rn.Category
LEFT JOIN rebill_failure_natural       rf    ON r.Category = rf.Category
LEFT JOIN net_bc1_arpu                 arpu  ON r.Category = arpu.Category
ORDER BY r.Category;
