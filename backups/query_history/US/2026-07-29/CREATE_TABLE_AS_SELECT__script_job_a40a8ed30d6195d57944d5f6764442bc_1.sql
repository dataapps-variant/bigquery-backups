-- job_id: script_job_a40a8ed30d6195d57944d5f6764442bc_1
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T09:00:17.146000+00:00
-- started: 2026-07-29T09:00:17.405000+00:00
-- ended: 2026-07-29T09:00:19.483000+00:00

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
      FORMAT('%d-%d-%d', 1,
        EXTRACT(MONTH FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', m.Acquisition_Date_Time)),
        EXTRACT(YEAR FROM PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', m.Acquisition_Date_Time))
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
      AND PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', m.Acquisition_Date_Time)
          >= TIMESTAMP('2023-01-01')
      AND PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', m.Acquisition_Date_Time)
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
    FOR Month_Key IN ('1-1-2023','1-2-2023','1-3-2023','1-4-2023','1-5-2023','1-6-2023','1-7-2023','1-8-2023','1-9-2023','1-10-2023','1-11-2023','1-12-2023','1-1-2024','1-2-2024','1-3-2024','1-4-2024','1-5-2024','1-6-2024','1-7-2024','1-8-2024','1-9-2024','1-10-2024','1-11-2024','1-12-2024','1-1-2025','1-2-2025','1-3-2025','1-4-2025','1-5-2025','1-6-2025','1-7-2025','1-8-2025','1-9-2025','1-10-2025','1-11-2025','1-12-2025','1-1-2026','1-2-2026','1-3-2026','1-4-2026','1-5-2026','1-6-2026')
  )
  ORDER BY Product_Group
