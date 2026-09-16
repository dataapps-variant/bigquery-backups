CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.Spend_Users_Analysis` AS
WITH users AS (
  SELECT
    CASE
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT'                                    THEN 'CT-Non-JP'
      ELSE App_Name
    END                                    AS App_Name,
    AFID_CHANNEL                           AS Channel_Code,
    DATE_TRUNC(Date_of_Sale, MONTH)        AS Month_Date,
    COUNT(DISTINCT Updated_Cust_ID)        AS BC0_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Date_of_Sale >= DATE '2026-01-01'
    AND Date_of_Sale <= CURRENT_DATE()
    AND (
          (Trial_Type =  'NT' AND Billing_Cycle_Updated = 1)
       OR (Trial_Type <> 'NT' AND Billing_Cycle_Updated = 0)
        )
  GROUP BY App_Name, Channel_Code, Month_Date
),

spend AS (
  SELECT
    App_Name                               AS App_Name,
    Channel_code                           AS Channel_Code,
    DATE_TRUNC(Date, MONTH)                AS Month_Date,
    SUM(allocated_spend)                   AS Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE Date >= DATE '2026-01-01'
    AND Date <= CURRENT_DATE()
  GROUP BY App_Name, Channel_Code, Month_Date
),

-- name per channel code, across the whole spend table (any month)
channel_lookup AS (
  SELECT
    Channel_code                           AS Channel_Code,
    ANY_VALUE(Channel_name)                AS Channel_Name
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE Channel_name IS NOT NULL
  GROUP BY Channel_code
)

SELECT
  COALESCE(u.App_Name,     s.App_Name)      AS App_Name,
  COALESCE(u.Channel_Code, s.Channel_Code)  AS Channel_Code,
  cl.Channel_Name                           AS Channel_Name,
  FORMAT_DATE('%b-%y', COALESCE(u.Month_Date, s.Month_Date)) AS Month,
  COALESCE(u.BC0_Users, 0)                  AS BC0_Users,
  COALESCE(s.Spend, 0)                      AS Spend,
  CASE
    WHEN COALESCE(s.Spend, 0)     > 0 AND COALESCE(u.BC0_Users, 0) = 0 THEN 'Spend, No Users'
    WHEN COALESCE(u.BC0_Users, 0) > 0 AND COALESCE(s.Spend, 0)     = 0 THEN 'Users, No Spend'
    ELSE 'OK'
  END                                       AS Flag
FROM users u
FULL OUTER JOIN spend s
  ON  u.App_Name     = s.App_Name
  AND u.Channel_Code = s.Channel_Code
  AND u.Month_Date   = s.Month_Date
LEFT JOIN channel_lookup cl
  ON COALESCE(u.Channel_Code, s.Channel_Code) = cl.Channel_Code
ORDER BY App_Name, Channel_Code, COALESCE(u.Month_Date, s.Month_Date);
