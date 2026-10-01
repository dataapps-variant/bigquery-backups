CREATE VIEW `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_RT`
AS WITH geographic_country_spend AS (
  -- Calculate spend ratios per country for each CampaignId and Date
  SELECT 
    Date,
    CampaignId,
    Country,
    -- Sum spend for this country (handles duplicates for same country/campaign/date)
    SUM(Spend) as country_spend,
    -- Calculate total geographic spend for this campaign/date
    SUM(SUM(Spend)) OVER (PARTITION BY Date, CampaignId) as total_geographic_spend,
    -- Calculate what percentage this country represents
    SUM(Spend) / SUM(SUM(Spend)) OVER (PARTITION BY Date, CampaignId) as spend_ratio
  FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_RT_GeographicPerformanceDailyReport`
  WHERE Country IS NOT NULL 
    AND Spend > 0  -- Automatically excludes zero-spend countries
  GROUP BY Date, CampaignId, Country  -- Handles duplicates by summing them
),
ad_performance_with_countries AS (
  -- Join ad performance with geographic data and split costs proportionally
  SELECT 
    ad.Date,
    ad.AccountId,
    ad.AccountName,
    ad.AccountNumber,
    ad.CampaignId,
    ad.CampaignName,
    ad.CampaignType,
    ad.BaseCampaignId,
    ad.AdGroupId,
    ad.AdId,
    ad.AdType,
    ad.CustomerId,
    ad.CurrencyCode,
    ad.DestinationUrl,
    ad.DisplayUrl,
    ad.FinalAppUrl,
    ad.FinalMobileUrl,
    ad.FinalUrl,
    ad.FinalUrlSuffix,
    -- MODIFIED: Use proportional allocation instead of equal split
    ad.Spend * COALESCE(geo.spend_ratio, 1) as split_spend,
    COALESCE(geo.Country, 'Unknown') as Country
  FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_RT_AdPerformanceDailyReport` ad
  LEFT JOIN geographic_country_spend geo
    ON ad.CampaignId = geo.CampaignId 
    AND ad.Date = geo.Date
)
SELECT 
  -- Static channel name
  'MS_Ads' as Channel_name,
  
  -- Date mapping
  apc.Date,
  
  -- Channel type from campaign type
  apc.CampaignType as Channel_type,
  
  -- Channel code lookup
  COALESCE(ccm.Channel_code, 'Unknown') as Channel_code,
  
  -- App name lookup with fallback to 'RT'
  COALESCE(fem.`App_name`, 'RT') as App_name,
  
  -- AFID extraction from FinalUrlSuffix
  CASE 
    WHEN apc.FinalUrlSuffix LIKE '%afid=%' THEN
      CASE 
        WHEN REGEXP_CONTAINS(apc.FinalUrlSuffix, r'afid=([^&]+)') THEN
          REGEXP_EXTRACT(apc.FinalUrlSuffix, r'afid=([^&]+)')
        ELSE
          apc.FinalUrlSuffix
      END
    ELSE
      apc.FinalUrlSuffix
  END as Final_URL_suffix_AFID,
  
  -- Country code lookup
  COALESCE(gcm.`Country Code`, Null) as Country,
  
  -- Proportionally split amount
  apc.split_spend as Amount,
  
  -- Static source
  'ad stats' as Source
FROM ad_performance_with_countries apc
-- Join with channel name code map for channel code lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` ccm
  ON ccm.Channel_name = 'MS_Ads' 
  AND ccm.Channel_type = apc.CampaignType
-- Join with final URL entity name map for app name lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map` fem
  ON fem.Final_Url = apc.FinalUrl
-- Join with geocode country code map for country code lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map` gcm
  ON gcm.`Name` = apc.Country
WHERE apc.Date IS NOT NULL
ORDER BY apc.Date, apc.CampaignId, apc.Country;
