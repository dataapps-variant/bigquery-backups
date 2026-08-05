CREATE VIEW `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_merged_final_spend`
AS SELECT 
    -- Static field
    'Linkedin_Ads' AS Channel_name,
    
    -- Direct from base table
    base.Date,
    
    -- Multi-step lookup: AdId -> Linkedin_Ads -> CampaignId -> Linkedin_Campaigns -> Type
    campaigns.Type AS Channel_type,
    
    -- Lookup using Channel_name + Channel_type combination
    channel_map.Channel_code,
    
    -- Two-step lookup: AdId -> Linkedin_Ads -> AccountId -> Dim_custid_map -> App_name
    custid_map.`App_ name` AS App_name,
    
    -- URL parsing: AdId -> Linkedin_Ads_URL -> Click_URL -> Extract AFID
    CASE 
        WHEN REGEXP_CONTAINS(url_data.`Click URL`, r'afid=([^&]+)') 
        THEN REGEXP_EXTRACT(url_data.`Click URL`, r'afid=([^&]+)')
        ELSE url_data.`Click URL`
    END AS Final_URL_suffix_AFID,
    
    -- Same path as Channel_type but get Locale_Country
    campaigns.Locale_Country AS Country,
    
    -- Direct from base table (cast to Float)
    CAST(base.CostInUsd AS FLOAT64) AS Amount,
    
    -- Static field
    'ad stats' AS Source

FROM 
    `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_AdsDailyReport` base

-- Join to get Campaign details
LEFT JOIN `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_Ads` ads
    ON base.AdId = ads.Id

LEFT JOIN `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_Campaigns` campaigns
    ON ads.CampaignId = campaigns.Id

-- Join to get App name using AccountId
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_Linkedin_custid_appname_map` custid_map
    ON ads.AccountId = custid_map.external_customer_id

-- Join to get URL data for AFID extraction
LEFT JOIN `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_Ads_URL` url_data
    ON base.AdId = url_data.`Ad ID`

-- Join to get App_name from Final_Url mapping (Primary method)
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map` finalurl_map
    ON url_data.`Click URL` = finalurl_map.Final_Url

-- Join to get Channel_code using combination of Channel_name and Channel_type
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_map
    ON channel_map.Channel_name = 'Linkedin_Ads' 
    AND channel_map.Channel_type = campaigns.Type

ORDER BY base.Date DESC, base.AdId;
