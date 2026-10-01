CREATE VIEW `variant-finance-data-project.Tiktok_ad_spend_data.Tiktok_final_spend_CT`
AS SELECT 
    'TikTok_Ads' as Channel_name,
    base.Date,
    campaigns.Type as Channel_type,
    
    -- Channel_code: Lookup using combination of Channel_name_Channel_type
    COALESCE(channel_map.Channel_code, '') as Channel_code,
    
    -- App_name: 3-step waterfall lookup
    -- Step 1: URL lookup -> Step 2: AdId override lookup -> Step 3: Default to 'CT'
    COALESCE(
        url_map.App_name,
        override_map.`Entity Name`,
        'CT'
    ) as App_name,
    
    -- Final_URL_suffix(AFID): Extract AFID parameter from landing page URL
    CASE 
        WHEN ads.LandingPageUrl LIKE '%afid=%' THEN
            CASE 
                WHEN REGEXP_CONTAINS(ads.LandingPageUrl, r'afid=([^&]+)') THEN
                    REGEXP_EXTRACT(ads.LandingPageUrl, r'afid=([^&]+)')
                ELSE
                    REGEXP_EXTRACT(ads.LandingPageUrl, r'afid=(.+)')
            END
        ELSE
            ads.LandingPageUrl
    END as Final_URL_suffix_AFID,
    
    -- Country: Chain lookup through AdGroup -> Location -> Country mapping
    COALESCE(country_map.`Country Code`, '') as Country,
    
    base.Spend as Amount,
    'ad stats' as Source

FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_AdsDailyReport` base

-- Join with campaigns to get campaign type (latest record only)
LEFT JOIN (
    SELECT Id, Type, _skyvia_sync
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_Campaigns`
    QUALIFY ROW_NUMBER() OVER (PARTITION BY Id ORDER BY _skyvia_sync DESC) = 1
) campaigns
    ON base.CampaignId = campaigns.Id

-- Join with ads to get landing page URL (latest record only)
LEFT JOIN (
    SELECT Id, LandingPageUrl, _skyvia_sync
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_Ads`
    QUALIFY ROW_NUMBER() OVER (PARTITION BY Id ORDER BY _skyvia_sync DESC) = 1
) ads
    ON base.AdId = ads.Id

-- Join with ad groups to get location IDs (latest record only)
LEFT JOIN (
    SELECT Id, LocationIds, _skyvia_sync
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_AdGroups`
    QUALIFY ROW_NUMBER() OVER (PARTITION BY Id ORDER BY _skyvia_sync DESC) = 1
) adgroups
    ON base.AdGroupId = adgroups.Id

-- Join with locations to get location names (extract LocationId from JSON array format)
-- Use only the first match for duplicate location IDs
LEFT JOIN (
    SELECT Id, Name
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_Locations`
    QUALIFY ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Id) = 1
) locations
    ON REGEXP_EXTRACT(adgroups.LocationIds, r'\["([^"]+)"\]') = locations.Id

-- Dimension table lookup for channel code
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_map
    ON CONCAT('TikTok_Ads_', campaigns.Type) = CONCAT(channel_map.Channel_name, '_', channel_map.Channel_type)

-- Dimension table lookup for app name using full URL
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map` url_map
    ON ads.LandingPageUrl = url_map.Final_Url

-- NEW: AdId override lookup for app name (cast INTEGER to STRING)
LEFT JOIN `variant-finance-data-project.Tiktok_ad_spend_data.AdId_EntityName_Map_Override` override_map
    ON base.AdId = CAST(override_map.ADID AS STRING)

-- Dimension table lookup for country code
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map` country_map
    ON locations.Name = country_map.Name;
