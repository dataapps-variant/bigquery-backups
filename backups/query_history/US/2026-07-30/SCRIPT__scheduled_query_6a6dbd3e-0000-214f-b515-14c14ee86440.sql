-- job_id: scheduled_query_6a6dbd3e-0000-214f-b515-14c14ee86440
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-30T09:00:12.777000+00:00
-- started: 2026-07-30T09:00:12.820000+00:00
-- ended: 2026-07-30T09:00:17.828000+00:00

DECLARE months_list STRING;
DECLARE query_str STRING;

-- Step 1: Dynamically build the list of months in chronological order
SET months_list = (
  SELECT STRING_AGG(month_quoted ORDER BY yr, mn)
  FROM (
    SELECT DISTINCT
      EXTRACT(YEAR FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)) AS yr,
      EXTRACT(MONTH FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)) AS mn,
      FORMAT("'%s'",
        FORMAT('%d-%d-%d', 1,
          EXTRACT(MONTH FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)),
          EXTRACT(YEAR FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time))
        )
      ) AS month_quoted
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)
          >= TIMESTAMP('2023-01-01')
      AND PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)
          < TIMESTAMP(DATE_TRUNC(CURRENT_DATE(), MONTH))
  )
);

-- Step 2: Build and execute the full query
SET query_str = FORMAT("""
  CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.LMC_New_Users` AS
  WITH product_map AS (
    SELECT DISTINCT
      Concat AS lookup_key,
      Updated_Concat
    FROM `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name`
  ),

  filtered AS (
    SELECT
      CASE
        WHEN LEFT(COALESCE(pm.Updated_Concat, m.Product_Name_Final), 2) = 'CT'
             AND m.Spend_Country_Code_AFID = 'JP'
          THEN CONCAT(COALESCE(pm.Updated_Concat, m.Product_Name_Final), '-JP')
        WHEN LEFT(COALESCE(pm.Updated_Concat, m.Product_Name_Final), 2) = 'CT'
             AND (m.Spend_Country_Code_AFID != 'JP' OR m.Spend_Country_Code_AFID IS NULL)
          THEN CONCAT(COALESCE(pm.Updated_Concat, m.Product_Name_Final), '-Non-JP')
        ELSE COALESCE(pm.Updated_Concat, m.Product_Name_Final)
      END AS Product_Group,
      FORMAT('%%d-%%d-%%d', 1,
        EXTRACT(MONTH FROM PARSE_TIMESTAMP('%%Y-%%m-%%d %%H:%%M:%%S', m.Acquisition_Date_Time)),
        EXTRACT(YEAR FROM PARSE_TIMESTAMP('%%Y-%%m-%%d %%H:%%M:%%S', m.Acquisition_Date_Time))
      ) AS Month_Key,
      m.Updated_Cust_ID
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` m
    LEFT JOIN product_map pm
      ON m.Product_Name_Final = pm.lookup_key
    WHERE
      RIGHT(m.Product_Name_Final, 2) != 'SS'
      AND (
        (RIGHT(m.Product_Name_Final, 2) = 'NT' AND m.Billing_Cycle_Updated = 1)
        OR
        (RIGHT(m.Product_Name_Final, 2) != 'NT' AND m.Billing_Cycle_Updated = 0)
      )
      AND PARSE_TIMESTAMP('%%Y-%%m-%%d %%H:%%M:%%S', m.Acquisition_Date_Time)
          >= TIMESTAMP('2023-01-01')
      AND PARSE_TIMESTAMP('%%Y-%%m-%%d %%H:%%M:%%S', m.Acquisition_Date_Time)
          < TIMESTAMP(DATE_TRUNC(CURRENT_DATE(), MONTH))
  ),

  aggregated AS (
    SELECT
      Product_Group,
      Month_Key,
      COUNT(DISTINCT Updated_Cust_ID) AS User_Count
    FROM filtered
    GROUP BY 1, 2
  )

  SELECT *
  FROM aggregated
  PIVOT (
    SUM(User_Count)
    FOR Month_Key IN (%s)
  )
  ORDER BY Product_Group
""", months_list);

EXECUTE IMMEDIATE query_str;
