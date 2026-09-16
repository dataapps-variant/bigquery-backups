CREATE OR REPLACE VIEW `variant-finance-data-project.Tiktok_ad_spend_data.Tiktok_final_spend_JF` AS
SELECT 
    'TikTok_Ads' as Channel_name,
    base.Date,
    campaigns.Type as Channel_type,
    
    -- Channel_code: Lookup using combination of Channel_name_Channel_type
    COALESCE(channel_map.Channel_code, '') as Channel_code,
    
    -- App_name: Use full URL for lookup in dim table
    COALESCE(
        url_map.App_name,
        'JF'
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

FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_AdsDailyReport` base

-- Join with campaigns to get campaign type (latest record only)
LEFT JOIN (
    SELECT Id, Type, _skyvia_sync
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_Campaigns`
    QUALIFY ROW_NUMBER() OVER (PARTITION BY Id ORDER BY _skyvia_sync DESC) = 1
) campaigns
    ON base.CampaignId = campaigns.Id

-- Join with ads to get landing page URL (latest record only)
LEFT JOIN (
    SELECT Id, LandingPageUrl, _skyvia_sync
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_Ads`
    QUALIFY ROW_NUMBER() OVER (PARTITION BY Id ORDER BY _skyvia_sync DESC) = 1
) ads
    ON base.AdId = ads.Id

-- Join with ad groups to get location IDs (latest record only)
LEFT JOIN (
    SELECT Id, LocationIds, _skyvia_sync
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_AdGroups`
    QUALIFY ROW_NUMBER() OVER (PARTITION BY Id ORDER BY _skyvia_sync DESC) = 1
) adgroups
    ON base.AdGroupId = adgroups.Id

-- Join with locations to get location names (extract LocationId from JSON array format)
-- Use only the first match for duplicate location IDs
LEFT JOIN (
    SELECT Id, Name
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_Locations`
    QUALIFY ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Id) = 1
) locations
    ON REGEXP_EXTRACT(adgroups.LocationIds, r'\["([^"]+)"\]') = locations.Id

-- Dimension table lookup for channel code
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_map
    ON CONCAT('TikTok_Ads_', campaigns.Type) = CONCAT(channel_map.Channel_name, '_', channel_map.Channel_type)

-- Dimension table lookup for app name using full URL
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map` url_map
    ON ads.LandingPageUrl = url_map.Final_Url

-- Dimension table lookup for country code
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map` country_map
    ON locations.Name = country_map.Name;
