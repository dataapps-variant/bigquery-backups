CREATE VIEW `variant-finance-data-project.Sticky_Data.Sticky_Sales_V_FS_W_EC`
AS WITH IP_Parse AS (
  SELECT 
    FS.*,
    'FS' AS Entity_Name,
    LOWER(TRIM(SPLIT(FS.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(FS.IP_Address_Lookup, ' ')) - 1)])) AS last_1_word,
    LOWER(TRIM(
      SPLIT(FS.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(FS.IP_Address_Lookup, ' ')) - 2)] || ' ' ||
      SPLIT(FS.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(FS.IP_Address_Lookup, ' ')) - 1)]
    )) AS last_2_words,
    LOWER(TRIM(
      SPLIT(FS.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(FS.IP_Address_Lookup, ' ')) - 3)] || ' ' ||
      SPLIT(FS.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(FS.IP_Address_Lookup, ' ')) - 2)] || ' ' ||
      SPLIT(FS.IP_Address_Lookup, ' ')[SAFE_OFFSET(ARRAY_LENGTH(SPLIT(FS
      .IP_Address_Lookup, ' ')) - 1)]
    )) AS last_3_words
  FROM `Sticky_Data.Sticky_FS`  FS
),

Country_Lookup_Base AS (
  SELECT 
    IP.*,
    COALESCE(CC3.Country_Name, CC2.Country_Name, CC1.Country_Name) AS IP_Country_Name,
    CONCAT(CAM.Entity,'_',CAM.Campaign_Id) AS CAMPAIGN_KEY,
    CAM.App_Name

  FROM IP_Parse IP

  LEFT JOIN Sticky_Data.Sticky_Dim_Country_Code CC1
    ON LOWER(CC1.Country_Name) = IP.last_1_word

  LEFT JOIN Sticky_Data.Sticky_Dim_Country_Code CC2
    ON LOWER(CC2.Country_Name) = IP.last_2_words

  LEFT JOIN Sticky_Data.Sticky_Dim_Country_Code CC3
    ON LOWER(CC3.Country_Name) = IP.last_3_words
  
  LEFT JOIN `Sticky_Data.Sticky_Dim_Campaign` CAM
    ON CONCAT('FS_', ip.Campaign_Id) = CONCAT(CAM.Entity,'_',CAM.Campaign_Id)
),

Sales_Tax_Latest AS (
  SELECT 
  
    CL.Order_Id,
         COALESCE(ST.VAT_Rate,0) as VAT_Rate,
     COALESCE(CL.sales_tax_factor,0) as sales_tax_factor,
    ROW_NUMBER() OVER (
      PARTITION BY CL.Order_Id
      ORDER BY ST.From_Date DESC
    ) AS rn
  FROM Country_Lookup_Base CL

  LEFT JOIN Sticky_Data.Sticky_Dim_Country_Code CC_Tax 
    ON COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_Name, 'OR') = CC_Tax.Country_Name

  LEFT JOIN Sticky_Data.Sticky_Dim_Sales_Tax ST 
    ON ST.Country = CC_Tax.Country_Code
   AND ST.App_Name = CL.App_Name
   AND ST.From_Date <= CAST(CL.Date_of_Sale AS DATE)
)

SELECT 
  CL.*,
  
  CONCAT('FS_', CL.Customer_Number,CL.Acquisition_Date_Time) AS Updated_Cust_ID,
  CONCAT('FS_', CL.Order_Id ) AS Updated_Order_ID,

  COALESCE(AF.Country_name, CL.IP_Country_Name, CL.Ship_Country, CL.Bill_Country, 'OR') AS Spend_Country,
  COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_Name, AF.Country_name, 'OR') AS Tax_Country,
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

  CC_Tax.Country_Code AS Tax_Country_Code,
  CC_Spend.Country_Code AS Spend_Country_Code,

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
        WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
        ELSE SAFE_MULTIPLY(OFR.Trial_Price, CL.Quantity)
      END
    ELSE SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
  END AS Plan_Price_Native_Currency,

  CL.Order_Total AS Order_Total_Native_Currency,

  CASE 
    WHEN CC_Tax.Country_Code = 'US' THEN CL.SALES_TAX_FACTOR
    ELSE SAFE_MULTIPLY(
           SAFE_DIVIDE(CL.Order_Total, 1 + STL.VAT_Rate),
           STL.VAT_Rate
         )
  END AS Sales_Tax_Amount_Native_Currency,

  SAFE_SUBTRACT(
    CL.Order_Total,
    CASE 
      WHEN CC_Tax.Country_Code = 'US' THEN CL.SALES_TAX_FACTOR
      ELSE SAFE_MULTIPLY(
             SAFE_DIVIDE(CL.Order_Total, 1 + STL.VAT_Rate),
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
            WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
            ELSE SAFE_MULTIPLY(OFR.Trial_Price, CL.Quantity)
          END
        ELSE SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
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
            WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
            ELSE SAFE_MULTIPLY(OFR.Trial_Price, CL.Quantity)
          END
        ELSE SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
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
          WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
          ELSE SAFE_MULTIPLY(OFR.Trial_Price, CL.Quantity)
        END
      ELSE SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
    END,
      CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX.Value_USD
  END
  ) AS Plan_Price_USD,

SAFE_MULTIPLY(
  CL.Order_Total,
  CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX.Value_USD
  END
) AS Order_Total_USD,

  SAFE_MULTIPLY(
    CASE 
      WHEN CC_Tax.Country_Code = 'US' THEN CL.Sales_Tax_Factor
      ELSE SAFE_MULTIPLY(
             SAFE_DIVIDE(CL.Order_Total, 1 + STL.VAT_Rate),
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
      CL.Order_Total,
      CASE 
        WHEN CC_Tax.Country_Code = 'US' THEN CL.Sales_Tax_Factor
        ELSE SAFE_MULTIPLY(
               SAFE_DIVIDE(CL.Order_Total, 1 + STL.VAT_Rate),
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
              WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
              ELSE SAFE_MULTIPLY(OFR.Trial_Price, CL.Quantity)
            END
          ELSE SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
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
              WHEN OFR.Trial_Type = 'SS' THEN SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
              ELSE SAFE_MULTIPLY(OFR.Trial_Price, CL.Quantity)
            END
          ELSE SAFE_MULTIPLY(PROD.Product_Price, CL.Quantity)
        END,
        1 + STL.VAT_Rate
      )
    END,
      CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX.Value_USD
  END
  ) AS Plan_Price_Net_of_Tax_USD,

  OS.Code AS FINAL_ORDER_STATUS,
  IFNULL(AF.AFID_CHANNEL, 99) AS AFID_CHANNEL,

  SAFE_MULTIPLY(CL.Refund_Amount,
     CASE 
    WHEN CL.Currency = 'USD' THEN 1.0
    ELSE FX_Refund.Value_USD
  END
  )AS Refund_Amount_USD

FROM Country_Lookup_Base CL

LEFT JOIN Sales_Tax_Latest STL ON CL.Order_Id = STL.Order_Id AND STL.rn = 1

LEFT JOIN Sticky_Data.Sticky_Dim_AFID AF 
  ON CONCAT('FS_', CL.AFID) = CONCAT(AF.ENTITY, '_', AF.AFID)

LEFT JOIN Sticky_Data.Sticky_Dim_Product PROD 
  ON CONCAT('FS_', CL.Product_Id) = CONCAT(PROD.ENTITY, '_', PROD.Product_ID)

LEFT JOIN Sticky_Data.Sticky_Dim_Country_Code CC_Tax 
  ON COALESCE(CL.Bill_Country, CL.Ship_Country, CL.IP_Country_Name, AF.Country_name, 'OR') = CC_Tax.Country_Name

LEFT JOIN Sticky_Data.Sticky_Dim_Country_Code CC_Spend 
  ON COALESCE(AF.Country_name, CL.IP_Country_Name, CL.Bill_Country, CL.Ship_Country, 'OR') = CC_Spend.Country_Name

LEFT JOIN Sticky_Data.Sticky_Dim_Exchnage_Rate FX 
  ON FX.Date = DATE(CL.Date_of_Sale) 
     AND FX.Currency = CL.Currency

LEFT JOIN Sticky_Data.Sticky_Dim_Exchnage_Rate FX_Refund
  ON FX_Refund.Date = DATE(CL.Date_of_Sale)
     AND FX_Refund.Currency = CL.Currency

LEFT JOIN Sticky_Data.Sticky_Dim_Offer OFR 
  ON CONCAT('FS_', CL.Offer_Id) = CONCAT(OFR.Entity, '_', OFR.ID)

LEFT JOIN Sticky_Data.Sticky_Dim_Order_Status OS
  ON CONCAT('FS_', CL.Order_Status) = CONCAT('FS_', OS.Order_Status)

WHERE CL.test = 'NO'
and OS.Code in(2,6);
