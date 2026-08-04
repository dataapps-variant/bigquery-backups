CREATE VIEW `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT_W_EC`
AS WITH 
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
    ATT.*,
    'AT' AS Entity_Name,
    LOWER(TRIM(SPLIT(ATT.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(ATT.IP_Address_Lookup, ' ')) - 1)])) AS last_1_word,
    LOWER(TRIM(
      SPLIT(ATT.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(ATT.IP_Address_Lookup, ' ')) - 2)] || ' ' ||
      SPLIT(ATT.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(ATT.IP_Address_Lookup, ' ')) - 1)]
    )) AS last_2_words,
    LOWER(TRIM(
      SPLIT(ATT.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(ATT.IP_Address_Lookup, ' ')) - 3)] || ' ' ||
      SPLIT(ATT.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(ATT.IP_Address_Lookup, ' ')) - 2)] || ' ' ||
      SPLIT(ATT.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(ATT.IP_Address_Lookup, ' ')) - 1)]
    )) AS last_3_words
  FROM variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT as ATT
),

Country_Lookup_Base AS (
  SELECT 
    IP.*,
    
    COALESCE(CC3.Country_Code, CC2.Country_Code, CC1.Country_Code) AS IP_Country_Code,
    
    COALESCE(CC_Bill_Name.Country_Code, IP.Bill_Country) AS Bill_Country_Code,
    COALESCE(CC_Ship_Name.Country_Code, IP.Ship_Country) AS Ship_Country_Code,
    
    CONCAT(CAM.Entity,'_',CAM.Campaign_Id) AS CAMPAIGN_KEY,
    CAM.App_Name,
    GT.Currency,
    -----------------------------------------
    AF.Country_Code,
     IFNULL(AF.AFID_CHANNEL, 99) AS AFID_CHANNEL,
---------------------------------------------------------


  FROM IP_Parse IP

  -- Replace all Country_Code joins with the cleaned version
  LEFT JOIN Country_Clean CC1
    ON LOWER(CC1.Country_Name) = IP.last_1_word

  LEFT JOIN Country_Clean CC2
    ON LOWER(CC2.Country_Name) = IP.last_2_words

  LEFT JOIN Country_Clean CC3
    ON LOWER(CC3.Country_Name) = IP.last_3_words
  
  LEFT JOIN `Sticky_Data.Sticky_Dim_Campaign` CAM
    ON CONCAT('AT_', ip.Campaign_Id) = CONCAT(CAM.Entity,'_',CAM.Campaign_Id)
----------------------------------------------------------
  LEFT JOIN Sticky_Data.Sticky_Dim_AFID AF 
  ON  ip.AFID =  AF.AFID  
 ----------------------------------------------------   
  LEFT JOIN Country_Clean CC_Bill_Name
    ON IP.Bill_Country = CC_Bill_Name.Country_Name
    
  LEFT JOIN Country_Clean CC_Ship_Name
    ON IP.Ship_Country = CC_Ship_Name.Country_Name

  LEFT JOIN  `Sticky_Data.Sticky_Dim_Gateways` GT
    ON concat(IP.Entity_Name,'_',IP.Gateway_ID) = concat(GT.Entity,'_',cast(GT.Gateway_ID as string))
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
    FIRST_VALUE(cast(SALES_TAX_FACTOR as float64)) OVER (
      PARTITION BY Order_Id 
      ORDER BY From_Date DESC, VAT_Rate
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) as sales_tax_factor
  FROM (
    SELECT 
      CL.Order_Id,
     CASE 
  WHEN LOWER(CL.Is_Refund) = 'yes' OR CL.Is_Chargeback = '1' 
    THEN 0
  ELSE COALESCE(ST.VAT_Rate, 0)
END AS VAT_Rate,
     
      COALESCE(cast(CL.SALES_TAX_FACTOR as float64),0) as sales_tax_factor,
      ST.From_Date,
      ROW_NUMBER() OVER (
        PARTITION BY CL.Order_Id
        ORDER BY ST.From_Date DESC, ST.VAT_Rate
      ) AS rn
    FROM Country_Lookup_Base CL
----------------------------------------------------------------------------------------
    LEFT JOIN Country_Clean CC_Tax 
      ON COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_code,CL.Country_Code ,'OR') = CC_Tax.Country_Code
----------------------------------------------------------------------------------------
    LEFT JOIN Sticky_Data.Sticky_Dim_Sales_Tax ST 
      ON ST.Country = CC_Tax.Country_Code
     AND ST.Entity_Name = CL.Entity_Name
     AND ST.From_Date <= CAST(CL.Date_of_Sale AS DATE)
  )
  WHERE rn = 1
)

SELECT 
  CL.*,
  
  CONCAT('AT_', CL.Customer_Number,CL.Acquisition_Date_Time) AS Updated_Cust_ID,
  CONCAT('AT_', CL.Order_Id ) AS Updated_Order_ID,

  COALESCE(
    NULLIF(CL.Country_Code, 'OR'),
    CASE WHEN CL.IP_Country_Code IN (SELECT DISTINCT Country_Code FROM Sticky_Data.Sticky_Dim_AFID WHERE Country_Code IS NOT NULL AND TRIM(Country_Code) != '') THEN CL.IP_Country_Code END,
    CASE WHEN CL.Ship_Country IN (SELECT DISTINCT Country_Code FROM Sticky_Data.Sticky_Dim_AFID WHERE Country_Code IS NOT NULL AND TRIM(Country_Code) != '') THEN CL.Ship_Country END,
    CASE WHEN CL.Bill_Country IN (SELECT DISTINCT Country_Code FROM Sticky_Data.Sticky_Dim_AFID WHERE Country_Code IS NOT NULL AND TRIM(Country_Code) != '') THEN CL.Bill_Country END,
    'OR'
  ) AS Spend_Country,
  COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_Code, CL.Country_Code, 'OR') AS Tax_Country,
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

  COALESCE(
    NULLIF(CL.Country_Code, 'OR'),
    CASE WHEN CL.IP_Country_Code IN (SELECT DISTINCT Country_Code FROM Sticky_Data.Sticky_Dim_AFID WHERE Country_Code IS NOT NULL AND TRIM(Country_Code) != '') THEN CL.IP_Country_Code END,
    CASE WHEN CL.Ship_Country IN (SELECT DISTINCT Country_Code FROM Sticky_Data.Sticky_Dim_AFID WHERE Country_Code IS NOT NULL AND TRIM(Country_Code) != '') THEN CL.Ship_Country END,
    CASE WHEN CL.Bill_Country IN (SELECT DISTINCT Country_Code FROM Sticky_Data.Sticky_Dim_AFID WHERE Country_Code IS NOT NULL AND TRIM(Country_Code) != '') THEN CL.Bill_Country END,
    'OR'
  ) AS Spend_Country_Code,
  COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_Code, CL.Country_Code, 'OR') AS Tax_Country_Code,

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

  Cast(CL.Order_Total as float64) AS Order_Total_Native_Currency,

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
      WHEN CC_Tax.Country_Code = 'US' THEN cast(CL.SALES_TAX_FACTOR as float64) 
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
        WHEN CC_Tax.Country_Code = 'US' THEN cast(CL.SALES_TAX_FACTOR as float64) 
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

 -- IFNULL(CL.AFID_CHANNEL, 99) AS AFID_CHANNEL,

  SAFE_ADD(
  SAFE_MULTIPLY(
    Cast(CL.Refund_Amount as float64),
    CASE 
      WHEN CL.Currency = 'USD' THEN 1.0
      ELSE FX_Refund.Value_USD
    END
  ),
  CASE 
    WHEN CL.Is_Chargeback = '1' AND LOWER(CL.Is_Refund) = 'no' THEN 
      SAFE_MULTIPLY(
        Cast(CL.Order_Total as float64),
        CASE 
          WHEN CL.Currency = 'USD' THEN 1.0
          ELSE FX_Refund.Value_USD
        END
      )
    ELSE 0
  END
) AS Refund_Amount_USD

FROM Country_Lookup_Base CL

LEFT JOIN Sales_Tax_Latest STL ON CL.Order_Id = STL.Order_Id

--LEFT JOIN Sticky_Data.Sticky_Dim_AFID AF 
--  ON  CL.AFID =  AF.AFID

LEFT JOIN Sticky_Data.Sticky_Dim_Product PROD 
  ON CONCAT('AT_', CL.Product_Id) = CONCAT(PROD.ENTITY, '_', PROD.Product_ID)

-- Use cleaned country dimension for remaining joins
LEFT JOIN Country_Clean CC_Tax 
  ON COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_Code, CL.Country_Code, 'OR') = CC_Tax.Country_Code

LEFT JOIN Country_Clean CC_Spend 
  ON COALESCE(CL.Country_Code, CL.IP_Country_Code, CL.Bill_Country, CL.Ship_Country, 'OR') = CC_Spend.Country_Code

LEFT JOIN Sticky_Data.Sticky_Dim_Exchnage_Rate FX 
  ON FX.Date = DATE(CL.Date_of_Sale) 
     AND FX.Currency = CL.Currency

LEFT JOIN Sticky_Data.Sticky_Dim_Exchnage_Rate FX_Refund
  ON FX_Refund.Date = DATE(CL.Date_of_Sale)
     AND FX_Refund.Currency = CL.Currency

LEFT JOIN Sticky_Data.Sticky_Dim_Offer OFR 
  ON CONCAT('AT_', CL.Offer_Id) = CONCAT(OFR.Entity, '_', OFR.ID)

WHERE CL.test = '0';
