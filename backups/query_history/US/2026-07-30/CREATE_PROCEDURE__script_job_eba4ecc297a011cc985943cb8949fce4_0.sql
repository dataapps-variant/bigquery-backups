-- job_id: script_job_eba4ecc297a011cc985943cb8949fce4_0
-- user: dataapps@variant.net
-- statement_type: CREATE_PROCEDURE
-- created: 2026-07-30T09:54:28.523000+00:00
-- started: 2026-07-30T09:54:28.685000+00:00
-- ended: 2026-07-30T09:54:28.800000+00:00

CREATE OR REPLACE PROCEDURE `variant-finance-data-project.Icarus_Spend_Country_AFID.proc_SCA_Plan_List`()
BEGIN

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Plan_List` AS

WITH First_Sale_Dates AS (
  SELECT 
      Product_Name_Final_Merged,
      Spend_Country_Code_AFID,
      MIN(Date_of_Sale) AS Earliest_Sale_Date
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Product_Name_Final_Merged IS NOT NULL
    AND Product_Name_Final_Merged != ''
    AND Spend_Country_Code_AFID IS NOT NULL
  GROUP BY Product_Name_Final_Merged, Spend_Country_Code_AFID
),

base_plan_list AS (
  SELECT 
      main.Product_Name_Final_Merged AS Product_Name_Final,
      main.Entity_Name,
      main.App_Name,
      main.Spend_Country_Code_AFID,
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
  LEFT JOIN
      First_Sale_Dates fsd
      ON main.Product_Name_Final_Merged = fsd.Product_Name_Final_Merged
      AND main.Spend_Country_Code_AFID = fsd.Spend_Country_Code_AFID
  WHERE 
      main.Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
      AND main.Product_Name_Final_Merged IS NOT NULL
      AND main.Product_Name_Final_Merged != ''
      AND RIGHT(main.Product_Name_Final_Merged, 2) != 'SS'
      AND main.Billing_Cycle_Updated BETWEEN 0 AND 12
      AND main.Spend_Country_Code_AFID IS NOT NULL
  GROUP BY 
      main.Product_Name_Final_Merged,
      main.Entity_Name,
      main.App_Name,
      main.Spend_Country_Code_AFID,
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
    bpl.*
FROM base_plan_list bpl
LEFT JOIN `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Country_List` country_list
    ON CASE
         WHEN bpl.App_Name = 'CT' AND bpl.Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
         WHEN bpl.App_Name = 'CT' AND bpl.Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
         ELSE bpl.App_Name
       END = country_list.App_Name
    AND bpl.Spend_Country_Code_AFID = country_list.Spend_Country_Code_AFID
WHERE 
    bpl.Spend_Country_Code_AFID IS NULL
    OR country_list.Last_30D_Over_50 = 'Yes'
ORDER BY 
    bpl.Product_Name_Final,
    bpl.Entity_Name,
    bpl.App_Name,
    bpl.Country_Code;

END
