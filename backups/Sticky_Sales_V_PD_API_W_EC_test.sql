CREATE OR REPLACE VIEW Sticky_Data.Sticky_Sales_V_PD_API_W_EC_test AS
WITH 
-- Step 1: Deduplicate Country Dimension to prevent join multiplication
Country_Clean AS (
  SELECT DISTINCT
    Country_Code,
    FIRST_VALUE(Country_Name) OVER (
      PARTITION BY Country_Code 
      ORDER BY 
        -- Prefer names without parentheses
        CASE WHEN REGEXP_CONTAINS(Country_Name, r'\(.*\)') THEN 2 ELSE 1 END,
        -- Prefer shorter names
        LENGTH(Country_Name),
        -- Alphabetical as tie-breaker
        Country_Name
    ) AS Country_Name
  FROM Sticky_Data.Sticky_Dim_Country_Code
),

IP_Parse AS (
  SELECT 
    PD.*,
    'PD' AS Entity_Name,
    LOWER(TRIM(SPLIT(PD.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(PD.IP_Address_Lookup, ' ')) - 1)])) AS last_1_word,
    LOWER(TRIM(
      SPLIT(PD.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(PD.IP_Address_Lookup, ' ')) - 2)] || ' ' ||
      SPLIT(PD.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(PD.IP_Address_Lookup, ' ')) - 1)]
    )) AS last_2_words,
    LOWER(TRIM(
      SPLIT(PD.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(PD.IP_Address_Lookup, ' ')) - 3)] || ' ' ||
      SPLIT(PD.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(PD.IP_Address_Lookup, ' ')) - 2)] || ' ' ||
      SPLIT(PD.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(PD.IP_Address_Lookup, ' ')) - 1)]
    )) AS last_3_words
  FROM `variant_finance_data_project_Sticky_Data_TEST_1.PD_API_V` as PD
),

Country_Lookup_Base AS (
  SELECT 
    IP.*,
    
    COALESCE(CC3.Country_Code, CC2.Country_Code, CC1.Country_Code) AS IP_Country_Code,
    
    COALESCE(CC_Bill_Name.Country_Code, IP.Bill_Country) AS Bill_Country_Code,
    COALESCE(CC_Ship_Name.Country_Code, IP.Ship_Country) AS Ship_Country_Code,
    
    CONCAT(CAM.Entity,'_',CAM.Campaign_Id) AS CAMPAIGN_KEY,
    CAM.App_Name,
    GT.Currency

  FROM IP_Parse IP

  -- Replace all Country_Code joins with the cleaned version
  LEFT JOIN Country_Clean CC1
    ON LOWER(CC1.Country_Name) = IP.last_1_word

  LEFT JOIN Country_Clean CC2
    ON LOWER(CC2.Country_Name) = IP.last_2_words

  LEFT JOIN Country_Clean CC3
    ON LOWER(CC3.Country_Name) = IP.last_3_words
  
  LEFT JOIN `Sticky_Data.Sticky_Dim_Campaign` CAM
    ON CONCAT('PD_', ip.Campaign_Id) = CONCAT(CAM.Entity,'_',CAM.Campaign_Id)
    
  LEFT JOIN Country_Clean CC_Bill_Name
    ON IP.Bill_Country = CC_Bill_Name.Country_Name
    
  LEFT JOIN Country_Clean CC_Ship_Name
    ON IP.Ship_Country = CC_Ship_Name.Country_Name

  LEFT JOIN  `Sticky_Data.Sticky_Dim_Gateway_API` GT
    ON concat(IP.Entity_Name,'_',IP.Gateway_ID) = concat(GT.Entity_Name,'_',cast(GT.Gateway_ID as string))
),

-- Step 2: Fix Sales Tax CTE to ensure one record per Order_Id
Sales_Tax_Latest AS (
  SELECT DISTINCT
    Order_Id,
    FIRST_VALUE(VAT_Rate) OVER (
      PARTITION BY Order_Id 
      ORDER BY From_Date DESC, VAT_Rate
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) as VAT_Rate,
    FIRST_VALUE(sales_tax_factor) OVER (
      PARTITION BY Order_Id 
      ORDER BY From_Date DESC, VAT_Rate
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) as sales_tax_factor
  FROM (
    SELECT 
      CL.Order_Id,
      COALESCE(ST.VAT_Rate,0) as VAT_Rate,
      COALESCE(cast(cast(CL.sales_tax_factor as float64) as int),0) as sales_tax_factor,
      ST.From_Date,
      ROW_NUMBER() OVER (
        PARTITION BY CL.Order_Id
        ORDER BY ST.From_Date DESC, ST.VAT_Rate
      ) AS rn
    FROM Country_Lookup_Base CL

    LEFT JOIN Country_Clean CC_Tax 
      ON COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_code, 'OR') = CC_Tax.Country_Name

    LEFT JOIN Sticky_Data.Sticky_Dim_Sales_Tax ST 
      ON ST.Country = CC_Tax.Country_Code
     AND ST.App_Name = CL.App_Name
     AND ST.From_Date <= CAST(CL.Date_of_Sale AS DATE)
  )
  WHERE rn = 1
)

SELECT 
  CL.*,
  
  CONCAT('PD_', CL.Customer_Number,CL.Acquisition_Date_Time) AS Updated_Cust_ID,
  CONCAT('PD_', CL.Order_Id ) AS Updated_Order_ID,

  COALESCE(AF.Country_Code, CL.IP_Country_Code, CL.Ship_Country, CL.Bill_Country, 'OR') AS Spend_Country,
  COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_Code, AF.Country_Code, 'OR') AS Tax_Country,
    OFR.Trial_Period,
    OFR.Trial_Price,
  OFR.Trial_Type,
  PROD.Product_Name_updated,
  CONCAT(CL.App_Name,PROD.Product_Name_updated,OFR.Trial_Type) AS Product_Name_Final,

  CASE 
    WHEN OFR.Trial_Type = 'NT' 
      THEN SAFE_CAST(CL.Billing_Cycle AS INT64) + 1
    ELSE SAFE_CAST(CL.Billing_Cycle AS INT64)
  END AS Billing_Cycle_Updated,

  COALESCE(AF.Country_Code, CL.IP_Country_Code, CL.Ship_Country, CL.Bill_Country, 'OR') AS Spend_Country_Code,
  COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_Code, AF.Country_Code, 'OR') AS Tax_Country_Code,

  CASE 
    WHEN CL.Currency != 'USD' THEN FX.Value_USD
    ELSE 1.0
  END AS Exchange_Rate,

  CASE 
    WHEN CC_Tax.Country_Code = 'US' THEN 0
    ELSE COALESCE(STL.VAT_Rate, 0)
  END AS Sales_Tax_Rate_Non_US,

  CASE
    WHEN (
      CASE 
        WHEN OFR.Trial_Type = 'NT' THEN SAFE_CAST(CL.Billing_Cycle AS INT64) + 1
        ELSE SAFE_CAST(CL.Billing_Cycle AS INT64)
      END
    ) = 0 THEN
      CASE 
        WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as float64))
        ELSE SAFE_MULTIPLY(OFR.Trial_Price, Cast(CL.Quantity as float64))
      END
    ELSE SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as float64))
  END AS Plan_Price_Native_Currency,

  cast(Cast(CL.Order_Total as float64)as int64) AS Order_Total_Native_Currency,

  CASE 
    WHEN CC_Tax.Country_Code = 'US' THEN cast(CL.SALES_TAX_FACTOR as float64)
    ELSE SAFE_MULTIPLY(
           SAFE_DIVIDE(Cast(CL.Order_Total as Float64), 1 + STL.VAT_Rate),
           STL.VAT_Rate
         )
  END AS Sales_Tax_Amount_Native_Currency,

  SAFE_SUBTRACT(
    cast(CL.Order_Total as float64),
    CASE 
      WHEN CC_Tax.Country_Code = 'US' THEN cast(CL.SALES_TAX_FACTOR as float64)
      ELSE SAFE_MULTIPLY(
             SAFE_DIVIDE(Cast(CL.Order_Total as Float64), 1 + STL.VAT_Rate),
             STL.VAT_Rate
           )
    END
  ) AS Order_Price_Net_of_Tax_Native_Currency,

  CASE 
    WHEN CC_Tax.Country_Code = 'US' THEN 
      CASE 
        WHEN (
          CASE 
            WHEN OFR.Trial_Type = 'NT' THEN SAFE_CAST(CL.Billing_Cycle AS INT64) + 1
            ELSE SAFE_CAST(CL.Billing_Cycle AS INT64)
          END
        ) = 0 THEN 
          CASE 
            WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
            ELSE SAFE_MULTIPLY(OFR.Trial_Price, Cast(CL.Quantity as Float64))
          END
        ELSE SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
      END
    ELSE SAFE_DIVIDE(
      CASE 
        WHEN (
          CASE 
            WHEN OFR.Trial_Type = 'NT' THEN SAFE_CAST(CL.Billing_Cycle AS INT64) + 1
            ELSE SAFE_CAST(CL.Billing_Cycle AS INT64)
          END
        ) = 0 THEN 
          CASE 
            WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
            ELSE SAFE_MULTIPLY(OFR.Trial_Price, Cast(CL.Quantity as Float64))
          END
        ELSE SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
      END,
      (1 + STL.VAT_Rate)
    )
  END AS Plan_Price_Net_of_Tax_Native_Currency,

  SAFE_MULTIPLY(
    CASE 
      WHEN (
        CASE 
          WHEN OFR.Trial_Type = 'NT' THEN SAFE_CAST(CL.Billing_Cycle AS INT64) + 1
          ELSE SAFE_CAST(CL.Billing_Cycle AS INT64)
        END
      ) = 0 THEN 
        CASE 
          WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
          ELSE SAFE_MULTIPLY(OFR.Trial_Price, Cast(CL.Quantity as Float64))
        END
      ELSE SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
    END,
      CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX.Value_USD
  END
  ) AS Plan_Price_USD,

SAFE_MULTIPLY(
  cast(CL.Order_Total as float64),
  CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX.Value_USD
  END
) AS Order_Total_USD,

  SAFE_MULTIPLY(
    CASE 
      WHEN CC_Tax.Country_Code = 'US' THEN Cast(CL.Sales_Tax_Factor as Float64)
      ELSE SAFE_MULTIPLY(
             SAFE_DIVIDE(cast(CL.Order_Total as float64), 1 + STL.VAT_Rate),
             STL.VAT_Rate
           )
    END,
      CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX.Value_USD
  END
  ) AS Sales_Tax_Amount_USD,

  SAFE_MULTIPLY(
    SAFE_SUBTRACT(
      Cast(CL.Order_Total as Float64),
      CASE 
        WHEN CC_Tax.Country_Code = 'US' THEN Cast(CL.Sales_Tax_Factor as float64)
        ELSE SAFE_MULTIPLY(
               SAFE_DIVIDE(Cast(CL.Order_Total as Float64), 1 + STL.VAT_Rate),
               STL.VAT_Rate
             )
      END
    ),
     CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX.Value_USD
  END
  ) AS Order_Price_Net_of_Tax_USD,

  SAFE_MULTIPLY(
    CASE 
      WHEN CC_Tax.Country_Code = 'US' THEN 
        CASE 
          WHEN (
            CASE 
              WHEN OFR.Trial_Type = 'NT' THEN SAFE_CAST(CL.Billing_Cycle AS INT64) + 1
              ELSE SAFE_CAST(CL.Billing_Cycle AS INT64)
            END
          ) = 0 THEN 
            CASE 
              WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
              ELSE SAFE_MULTIPLY(OFR.Trial_Price, Cast(CL.Quantity as Float64))
            END
          ELSE SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
        END
      ELSE SAFE_DIVIDE(
        CASE 
          WHEN (
            CASE 
              WHEN OFR.Trial_Type = 'NT' THEN SAFE_CAST(CL.Billing_Cycle AS INT64) + 1
              ELSE SAFE_CAST(CL.Billing_Cycle AS INT64)
            END
          ) = 0 THEN 
            CASE 
              WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
              ELSE SAFE_MULTIPLY(OFR.Trial_Price, Cast(CL.Quantity as Float64))
            END
          ELSE SAFE_MULTIPLY(PROD.Product_Price, Cast(CL.Quantity as Float64))
        END,
        1 + STL.VAT_Rate
      )
    END,
      CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX.Value_USD
  END
  ) AS Plan_Price_Net_of_Tax_USD,

  IFNULL(AF.AFID_CHANNEL, 99) AS AFID_CHANNEL,

  SAFE_MULTIPLY( Cast(CL.Refund_Amount as float64),
     CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX_Refund.Value_USD
  END
  )AS Refund_Amount_USD

FROM Country_Lookup_Base CL

LEFT JOIN Sales_Tax_Latest STL ON CL.Order_Id = STL.Order_Id

LEFT JOIN Sticky_Data.Sticky_Dim_AFID AF 
  ON CONCAT('PD_', CL.AFID) = CONCAT(AF.ENTITY, '_', AF.AFID)

LEFT JOIN Sticky_Data.Sticky_Dim_Product PROD 
  ON CONCAT('PD_', CL.Product_Id) = CONCAT(PROD.ENTITY, '_', PROD.Product_ID)

-- Use cleaned country dimension for remaining joins
LEFT JOIN Country_Clean CC_Tax 
  ON COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_Code, AF.Country_name, 'OR') = CC_Tax.Country_Name

LEFT JOIN Country_Clean CC_Spend 
  ON COALESCE(AF.Country_name, CL.IP_Country_Code, CL.Bill_Country, CL.Ship_Country, 'OR') = CC_Spend.Country_Name

LEFT JOIN Sticky_Data.Sticky_Dim_Exchnage_Rate FX 
  ON FX.Date = DATE(CL.Date_of_Sale) 
     AND FX.Currency = CL.Currency

LEFT JOIN Sticky_Data.Sticky_Dim_Exchnage_Rate FX_Refund
  ON FX_Refund.Date = DATE(CL.Date_of_Sale)
     AND FX_Refund.Currency = CL.Currency

LEFT JOIN Sticky_Data.Sticky_Dim_Offer OFR 
  ON CONCAT('PD_', CL.Offer_Id) = CONCAT(OFR.Entity, '_', OFR.ID)

WHERE CL.test = '0'
  AND CL.Final_Order_Status in(2,6)

-- Final safety net: ensure one record per Order_Id
--QUALIFY ROW_NUMBER() OVER (PARTITION BY CL.Order_Id ORDER BY CL.Order_Id) = 1;
