-- job_id: script_job_ebae8fef438e89973f40d79d678f2ed5_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T08:43:57.978000+00:00
-- started: 2026-07-29T08:43:58.551000+00:00
-- ended: 2026-07-29T08:43:59.853000+00:00

CREATE OR REPLACE TABLE `Icarus_Cohort.IC_Plan_List_AFID` AS
WITH config AS (
  SELECT DATE('2025-01-01') AS start_date
),

First_Sale_Dates AS (
  SELECT 
      main.Product_Name_Final_Merged,
      main.AFID,
      CASE 
          WHEN main.App_Name = 'CT' THEN 
              CASE 
                  WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
                  ELSE 'Non-JP'
              END
          ELSE ''
      END AS Country_Code,
      MIN(main.Date_of_Sale) AS Earliest_Sale_Date
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` main
  CROSS JOIN config
  WHERE main.Product_Name_Final_Merged IS NOT NULL
    AND main.Product_Name_Final_Merged != ''
    AND main.Date_of_Sale >= config.start_date
  GROUP BY 
      main.Product_Name_Final_Merged,
      main.AFID,
      Country_Code
),

base_plan_list AS (
  SELECT 
      main.Product_Name_Final_Merged AS Product_Name_Final,
      main.Entity_Name,
      main.App_Name,
      main.AFID AS AFID_Suffix,
      main.Trial_Type,
      main.Trial_Period,
      main.Currency,
      MIN(main.Trial_Price) AS Trial_Price,
      COALESCE(
          MIN(CASE WHEN dim.Currency = main.Currency THEN dim.Product_Price END),
          MIN(CASE WHEN TRIM(COALESCE(dim.Currency, '')) = '' THEN dim.Product_Price END)
      ) AS Regular_Price,
      
      CASE 
          WHEN main.App_Name = 'CT' THEN 
              CASE 
                  WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
                  ELSE 'Non-JP'
              END
          ELSE ''
      END AS Country_Code,
      GREATEST(
          COALESCE(MIN(fsd.Earliest_Sale_Date), DATE '2025-01-01'),
          DATE '2025-01-01'
      ) AS First_Date_of_Sale
      
  FROM 
      `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` main
  LEFT JOIN 
      `variant-finance-data-project.Sticky_Data.Sticky_Dim_Product` dim
      ON CONCAT(dim.Entity, dim.Product_Name_updated) = CONCAT(
          main.Entity_Name, 
          REGEXP_EXTRACT(main.Product_Name_Final_Merged, r'^.{2}(\d+)')
      )
      AND (dim.Currency = main.Currency OR TRIM(COALESCE(dim.Currency, '')) = '')
      LEFT JOIN First_Sale_Dates fsd
      ON main.Product_Name_Final_Merged = fsd.Product_Name_Final_Merged
      AND main.AFID = fsd.AFID
      AND CASE 
              WHEN main.App_Name = 'CT' THEN 
                  CASE 
                      WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
                      ELSE 'Non-JP'
                  END
              ELSE ''
          END = fsd.Country_Code
  CROSS JOIN config
  WHERE 
  main.Date_of_Sale >= config.start_date
      AND main.Product_Name_Final_Merged IS NOT NULL
      AND main.Product_Name_Final_Merged != ''
      AND RIGHT(main.Product_Name_Final_Merged, 2) != 'SS'
      AND main.Billing_Cycle_Updated BETWEEN 0 AND 12
  GROUP BY 
      main.Product_Name_Final_Merged,
      main.Entity_Name,
      main.App_Name,
      main.AFID,
      main.Trial_Type,
      main.Trial_Period,
      main.Currency,
      CASE 
          WHEN main.App_Name = 'CT' THEN 
              CASE 
                  WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
                  ELSE 'Non-JP'
              END
          ELSE ''
      END
)

SELECT 
    bpl.Product_Name_Final,
    bpl.Entity_Name,
    bpl.App_Name,
    bpl.AFID_Suffix,
    bpl.Trial_Type,
    bpl.Trial_Period,
    bpl.Currency,
    bpl.Trial_Price,
    bpl.Regular_Price,
    bpl.Country_Code,
    bpl.First_Date_of_Sale                                -- ADDED to output

FROM base_plan_list bpl
LEFT JOIN `variant-finance-data-project.Icarus_Cohort.IC_AFID_List` afid_list
    ON bpl.AFID_Suffix = afid_list.AFID
WHERE 
    bpl.AFID_Suffix IS NULL
    OR afid_list.Last_3_Months_Over_50 = 'Yes'
ORDER BY 
    bpl.Product_Name_Final,
    bpl.Entity_Name,
    bpl.App_Name,
    bpl.Country_Code
