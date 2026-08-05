CREATE VIEW `variant-finance-data-project.Ad_spend_data.Merged_Spend_View`
AS SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    CAST(Amount AS FLOAT64) as Amount,
    Source
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`

UNION ALL

-- TikTok Ads data
SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    CAST(Amount AS FLOAT64) as Amount,
    Source
FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_merged_spend_view`

UNION ALL

-- Microsoft Ads data
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
FROM `variant-finance-data-project.MS_ad_spend_data.MS_Merged_Spend_View`

UNION ALL

-- LinkedIn Ads data
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
FROM `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_merged_final_spend`

UNION ALL

-- Facebook Ads data
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
FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Merged_Spend_View`

UNION ALL

-- Yahoo Ads data
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
FROM `variant-finance-data-project.Yahoo_Ads.Yahoo_merged_final_spend`

UNION ALL

-- Yahoo Ads data
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
FROM `variant-finance-data-project.OpenAI_Ads.OpenAI_merged_final_spend`;
