CREATE VIEW `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Merged_Spend_View`
AS SELECT * FROM (
  
  -- CT App Data
  SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    Amount,
    Source
  FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_final_spend_CT`
  
  UNION ALL
  
  -- AT App Data
  SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    Amount,
    Source
  FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_final_spend_AT`
  
  UNION ALL
  
  -- JF App Data
  SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    Amount,
    Source
  FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_final_spend_JF`

)
WHERE Date IS NOT NULL
  AND Amount > 0  -- Exclude zero-spend records
ORDER BY Date DESC, App_name, Country;
