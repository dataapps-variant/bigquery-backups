CREATE VIEW `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_merged_spend_view`
AS SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    Amount,
    Source,
    'CT' as Data_Source -- Add identifier for source view
FROM `variant-finance-data-project.Tiktok_ad_spend_data.Tiktok_final_spend_CT`

UNION ALL

-- DT Data  
SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    Amount,
    Source,
    'DT' as Data_Source -- Add identifier for source view
FROM `variant-finance-data-project.Tiktok_ad_spend_data.Tiktok_final_spend_DT`

UNION ALL

-- JF Data
SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    Amount,
    Source,
    'JF' as Data_Source -- Add identifier for source view
FROM `variant-finance-data-project.Tiktok_ad_spend_data.Tiktok_final_spend_JF`;
