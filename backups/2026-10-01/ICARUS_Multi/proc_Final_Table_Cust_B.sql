CREATE PROCEDURE `variant-finance-data-project`.ICARUS_Multi.proc_Final_Table_Cust_B()
BEGIN

  DECLARE union_sql STRING DEFAULT '';
  DECLARE full_sql  STRING;

  -- -----------------------------------------------------------------
  -- Build the unioned_data block from whichever expected sources exist.
  -- -----------------------------------------------------------------
  FOR rec IN (
    SELECT tbl, cohort, ttype, rebills FROM UNNEST([
      STRUCT('7K_30D_Crystal_Ball_Cust_B' AS tbl, '7K_30D' AS cohort, 'Crystal Ball' AS ttype, 'CB_User'      AS rebills),
      STRUCT('7K_Crystal_Ball_Cust_B'     AS tbl, '7K'     AS cohort, 'Crystal Ball' AS ttype, 'CB_User'      AS rebills),
      STRUCT('7K_30D_Main_Table_Cust_B'   AS tbl, '7K_30D' AS cohort, 'Regular'      AS ttype, 'Rebill_users' AS rebills),
      STRUCT('7K_Main_Table_Cust_B'       AS tbl, '7K'     AS cohort, 'Regular'      AS ttype, 'Rebill_users' AS rebills)
    ])
  )
  DO
    IF (SELECT COUNT(1)
          FROM `variant-finance-data-project.ICARUS_Multi.INFORMATION_SCHEMA.TABLES`
          WHERE table_name = rec.tbl) > 0
    THEN
      IF union_sql != '' THEN SET union_sql = union_sql || "\nUNION ALL\n"; END IF;
      SET union_sql = union_sql ||
        "SELECT Report_date, Product_Name_Final, Billing_Cycle, Entity_Name, App_Name, Trial_Type, Country_Code, " ||
        "Subscription_users, " || rec.rebills || " AS Rebills_raw, SS_Users, Churn_rate, Refund_ratio, " ||
        "Retention_rate, NET_Retention_rate, CAC, Recent_CAC, T30D_New_Users, ARPU_Discounted, " ||
        "Net_ARPU_Discounted, Net_LTV_Discounted, '" || rec.cohort || "' AS Cohort, '" || rec.ttype || "' AS Table_Type " ||
        "FROM `variant-finance-data-project.ICARUS_Multi." || rec.tbl || "`";
    END IF;
  END FOR;

  IF union_sql = '' THEN
    RAISE USING MESSAGE =
      'proc_Final_Table_Cust_B: none of the expected _Cust_B source tables exist yet — nothing to build.';
  END IF;

  -- -----------------------------------------------------------------
  -- Assemble the full statement: dynamic union + static transformation.
  -- -----------------------------------------------------------------
  SET full_sql =
    "CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Final_Table_Cust_B` AS\n" ||
    "WITH unioned_data AS (\n" || union_sql || "\n),\n" ||
"""
-- =====================================================
-- DAILY NEW USERS  (chain-level Updated_Cust_ID — see header note)
-- =====================================================
daily_new_users AS (
  SELECT
    Date_of_Sale as Report_date,
    Product_Name_Final_Merged as Join_Key,
    'ALL' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as Daily_New_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name != 'CT'
    AND (
      (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
      OR (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
    )
  GROUP BY 1, 2, 3
  UNION ALL
  SELECT
    Date_of_Sale as Report_date,
    LEFT(Product_Name_Final_Merged, 8) as Join_Key,
    'CT-JP' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as Daily_New_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Spend_Country_Code_AFID = 'JP'
    AND (
      (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
      OR (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
    )
  GROUP BY 1, 2, 3
  UNION ALL
  SELECT
    Date_of_Sale as Report_date,
    LEFT(Product_Name_Final_Merged, 8) as Join_Key,
    'CT-Non-JP' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as Daily_New_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND (Spend_Country_Code_AFID != 'JP' OR Spend_Country_Code_AFID IS NULL)
    AND (
      (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
      OR (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
    )
  GROUP BY 1, 2, 3
),

-- =====================================================
-- DAILY SPEND
-- =====================================================
daily_spend AS (
  SELECT
    Date as Report_date,
    Product_Name_Final_Merged as Join_Key,
    'ALL' as App_Country_Key,
    SUM(allocated_spend) as Daily_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE App_Name NOT IN ('CT-JP', 'CT-Non-JP')
  GROUP BY 1, 2, 3
  UNION ALL
  SELECT
    Date as Report_date,
    LEFT(Product_Name_Final_Merged, 8) as Join_Key,
    'CT-JP' as App_Country_Key,
    SUM(allocated_spend) as Daily_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE App_Name = 'CT-JP'
  GROUP BY 1, 2, 3
  UNION ALL
  SELECT
    Date as Report_date,
    LEFT(Product_Name_Final_Merged, 8) as Join_Key,
    'CT-Non-JP' as App_Country_Key,
    SUM(allocated_spend) as Daily_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE App_Name = 'CT-Non-JP'
  GROUP BY 1, 2, 3
),

-- =====================================================
-- DAILY SS USERS  (chain-level Updated_Cust_ID — see header note)
-- =====================================================
daily_ss_users AS (
  SELECT
    Date_of_Sale as Report_date,
    Product_Name_Final_Main_Merged as Join_Key,
    'ALL' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as SS_Users_Daily
  FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
  WHERE App_Name != 'CT'
    AND Billing_Cycle_Updated = 0
  GROUP BY 1, 2, 3
  UNION ALL
  SELECT
    Date_of_Sale as Report_date,
    LEFT(Product_Name_Final_Main_Merged, 8) as Join_Key,
    'CT-JP' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as SS_Users_Daily
  FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Spend_Country_Code_AFID = 'JP'
    AND Billing_Cycle_Updated = 0
  GROUP BY 1, 2, 3
  UNION ALL
  SELECT
    Date_of_Sale as Report_date,
    LEFT(Product_Name_Final_Main_Merged, 8) as Join_Key,
    'CT-Non-JP' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as SS_Users_Daily
  FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
  WHERE App_Name = 'CT'
    AND (Spend_Country_Code_AFID != 'JP' OR Spend_Country_Code_AFID IS NULL)
    AND Billing_Cycle_Updated = 0
  GROUP BY 1, 2, 3
),

-- =====================================================
-- T7D SS USERS (7-day avg inclusive of report date)
-- =====================================================
t7d_ss_users AS (
  SELECT
    d.Report_date,
    d.Join_Key,
    d.App_Country_Key,
    d.SS_Users_Daily,
    AVG(d2.SS_Users_Daily) as T7D_SS_Users
  FROM daily_ss_users d
  LEFT JOIN daily_ss_users d2
    ON d.Join_Key = d2.Join_Key
    AND d.App_Country_Key = d2.App_Country_Key
    AND d2.Report_date BETWEEN DATE_SUB(d.Report_date, INTERVAL 6 DAY) AND d.Report_date
  GROUP BY 1, 2, 3, 4
),

-- =====================================================
-- T7D NEW USERS (7-day avg inclusive of report date)
-- =====================================================
t7d_new_users AS (
  SELECT
    d.Report_date,
    d.Join_Key,
    d.App_Country_Key,
    d.Daily_New_Users,
    AVG(d2.Daily_New_Users) as T7D_New_Users
  FROM daily_new_users d
  LEFT JOIN daily_new_users d2
    ON d.Join_Key = d2.Join_Key
    AND d.App_Country_Key = d2.App_Country_Key
    AND d2.Report_date BETWEEN DATE_SUB(d.Report_date, INTERVAL 6 DAY) AND d.Report_date
  GROUP BY 1, 2, 3, 4
),

-- =====================================================
-- CUMULATIVE METRICS
-- =====================================================
cumulative_metrics AS (
  SELECT
    ud.*,
    CASE
      WHEN ud.App_Name IN ('CT-JP', 'CT-Non-JP') THEN LEFT(ud.Product_Name_Final, 8)
      ELSE ud.Product_Name_Final
    END as Join_Key,
    CASE
      WHEN ud.App_Name IN ('CT-JP', 'CT-Non-JP') THEN ud.App_Name
      ELSE 'ALL'
    END as App_Country_Key,
    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Gross_ARPU_Discounted,
    SUM(ud.Net_ARPU_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_ARPU_Discounted_Cumulative,
    SUM(ud.Net_LTV_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_LTV_Discounted_Cumulative,
    SUM(ud.Refund_ratio) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Cumulative_Refund_raw
  FROM unioned_data ud
),

-- =====================================================
-- BROADCAST RECENT_CAC / COHORT_CAC / T30D + DAILY JOINS
-- =====================================================
recent_cac_broadcast AS (
  SELECT
    cm.*,
    dnu.Daily_New_Users as Daily_New_Users_val,
    dnu.T7D_New_Users as T7D_New_Users_val,
    ds.Daily_Spend as Daily_Spend_val,
    CASE
      WHEN dnu.Daily_New_Users IS NOT NULL AND dnu.Daily_New_Users > 0
      THEN ds.Daily_Spend / dnu.Daily_New_Users
      ELSE NULL
    END as Daily_CAC_val,
    MAX(CASE
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.Recent_CAC
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.Recent_CAC
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_Name_Final, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type
    ) as Recent_CAC_Broadcasted,
    MAX(CASE
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.CAC
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.CAC
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_Name_Final, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type
    ) as Cohort_CAC_Broadcasted,
    MAX(CASE
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.T30D_New_Users
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.T30D_New_Users
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_Name_Final, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type
    ) as T30D_New_Users_Broadcasted,
    t7d.SS_Users_Daily as SS_Users_Daily_val,
    t7d.T7D_SS_Users as T7D_SS_Users_val
  FROM cumulative_metrics cm
  LEFT JOIN t7d_new_users dnu
    ON cm.Report_date = dnu.Report_date
    AND cm.Join_Key = dnu.Join_Key
    AND cm.App_Country_Key = dnu.App_Country_Key
  LEFT JOIN daily_spend ds
    ON cm.Report_date = ds.Report_date
    AND cm.Join_Key = ds.Join_Key
    AND cm.App_Country_Key = ds.App_Country_Key
  LEFT JOIN t7d_ss_users t7d
    ON cm.Report_date = t7d.Report_date
    AND cm.Join_Key = t7d.Join_Key
    AND cm.App_Country_Key = t7d.App_Country_Key
),

-- =====================================================
-- BC4 CAC CEILING
-- =====================================================
bc4_ceiling_calc AS (
  SELECT
    rcb.*,
    MAX(CASE WHEN rcb.Billing_Cycle = 4 THEN rcb.Net_ARPU_Discounted_Cumulative ELSE NULL END)
      OVER (PARTITION BY rcb.Product_Name_Final, rcb.Report_date, rcb.Country_Code, rcb.Cohort, rcb.Table_Type) - 1.2
      as BC4_CAC_Ceiling
  FROM recent_cac_broadcast rcb
),

-- =====================================================
-- FIRST NULL BC DETECTION
-- =====================================================
first_null_detection AS (
  SELECT
    bcc.*,
    MIN(CASE
      WHEN bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 0 THEN NULL
      WHEN (bcc.Trial_Type != 'NT' AND bcc.Billing_Cycle = 0)
        OR (bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 1)
      THEN
        CASE
          WHEN (bcc.Subscription_users IS NULL OR bcc.Subscription_users = 0)
            OR (bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25)
          THEN bcc.Billing_Cycle
          ELSE NULL
        END
      WHEN (bcc.Trial_Type != 'NT' AND bcc.Billing_Cycle > 0)
        OR (bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle > 1)
      THEN
        CASE
          WHEN bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25
          THEN bcc.Billing_Cycle
          ELSE NULL
        END
      ELSE NULL
    END) OVER (
      PARTITION BY bcc.Product_Name_Final, bcc.Report_date, bcc.Country_Code, bcc.Cohort, bcc.Table_Type
    ) as First_Null_BC
  FROM bc4_ceiling_calc bcc
),

-- =====================================================
-- ACTIVE / INACTIVE STATUS
-- =====================================================
with_active_status AS (
  SELECT
    fnd.*,
    CASE
      WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active'
      ELSE 'Inactive'
    END as active_inactive_status
  FROM first_null_detection fnd
  LEFT JOIN (
    SELECT DISTINCT App_Name, Product_Name_Final
    FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
  ) ap
    ON fnd.App_Name = ap.App_Name
    AND fnd.Product_Name_Final = ap.Product_Name_Final
)

-- =====================================================
-- FINAL OUTPUT (28 columns)
-- =====================================================
SELECT
  Report_date as Reporting_Date,
  CASE
    WHEN Country_Code IS NOT NULL AND Country_Code != '' AND TRIM(Country_Code) != ''
    THEN CONCAT(Product_Name_Final, '-', Country_Code)
    ELSE Product_Name_Final
  END as Plan_Name,
  active_inactive_status as Active_Inactive,
  Billing_Cycle as BC,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country_Code as Country,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Subscription_users
  END as Subscriptions,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Rebills_raw
  END as Rebills,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN (Trial_Type = 'NT' AND Billing_Cycle = 1) OR (Trial_Type != 'NT' AND Billing_Cycle = 0)
    THEN SS_Users
    ELSE NULL
  END as Single_Sale,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Churn_rate
  END as Churn_Rate,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Refund_ratio
  END as Refund_Rate,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Retention_rate
  END as Gross_ARPU_Retention_Rate,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NET_Retention_rate
  END as Net_ARPU_Retention_Rate,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Cohort_CAC_Broadcasted
  END as Cohort_CAC,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Recent_CAC_Broadcasted
  END as Recent_CAC,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE T30D_New_Users_Broadcasted
  END as T30D_New_Users,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Gross_ARPU_Discounted
  END as Gross_ARPU_Discounted,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Net_ARPU_Discounted_Cumulative
  END as Net_ARPU_Discounted,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Net_LTV_Discounted_Cumulative
  END as Net_LTV_Discounted,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN (Subscription_users IS NULL OR Subscription_users = 0)
     AND (Rebills_raw IS NULL OR Rebills_raw = 0)
    THEN NULL
    ELSE BC4_CAC_Ceiling
  END as BC4_CAC_Ceiling,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Daily_New_Users_val
  END as Daily_New_Users,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE T7D_New_Users_val
  END as T7D_New_Users_Daily,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Daily_Spend_val
  END as Daily_Spend,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Daily_CAC_val
  END as Daily_CAC,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Cumulative_Refund_raw
  END as Cumulative_Refund,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE SS_Users_Daily_val
  END as SS_Users_Daily,
  CASE
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE T7D_SS_Users_val
  END as T7D_SS_Users,
  Cohort,
  Table_Type as Table
FROM with_active_status
ORDER BY
  Reporting_Date DESC,
  Plan_Name,
  Country,
  Cohort,
  Table,
  BC
""";

  EXECUTE IMMEDIATE full_sql;

END;
