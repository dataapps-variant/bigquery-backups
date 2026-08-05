CREATE VIEW `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_RT`
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

campaign_performance_with_countries AS (
  -- Join campaign performance with geographic data and split costs proportionally
  -- Only include campaigns NOT in ad performance report
  SELECT 
    cp.Date,
    cp.AccountId,
    cp.AccountName,
    cp.AccountNumber,
    cp.CampaignId,
    cp.CampaignName,
    cp.CampaignType,
    cp.BaseCampaignId,
    cp.CustomerId,
    cp.CurrencyCode,
    cp.FinalUrlSuffix,
    -- MODIFIED: Use proportional allocation instead of equal split
    cp.Spend * COALESCE(geo.spend_ratio, 1) as split_spend,
    COALESCE(geo.Country, Null) as Country
  FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_RT_CampaignPerformanceDailyReport` cp
  LEFT JOIN geographic_country_spend geo
    ON cp.CampaignId = geo.CampaignId 
    AND cp.Date = geo.Date
  WHERE NOT EXISTS (
    -- Exclude campaigns that exist in ad performance report
    SELECT 1 
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_RT_AdPerformanceDailyReport` ap
    WHERE ap.CampaignId = cp.CampaignId 
    AND ap.Date = cp.Date
  )
)

SELECT 
  -- Static channel name
  'MS_Ads' as Channel_name,
  
  -- Date mapping
  cpc.Date,
  
  -- Channel type from campaign type
  cpc.CampaignType as Channel_type,
  
  -- Channel code lookup
  COALESCE(ccm.Channel_code, Null) as Channel_code,
  
  -- Static app name
  'RT' as App_name,
  
  -- AFID extraction from FinalUrlSuffix
  CASE 
    WHEN cpc.FinalUrlSuffix LIKE '%afid=%' THEN
      CASE 
        WHEN REGEXP_CONTAINS(cpc.FinalUrlSuffix, r'afid=([^&]+)') THEN
          REGEXP_EXTRACT(cpc.FinalUrlSuffix, r'afid=([^&]+)')
        ELSE
          cpc.FinalUrlSuffix
      END
    ELSE
      cpc.FinalUrlSuffix
  END as Final_URL_suffix_AFID,
  
  -- Country code lookup
  COALESCE(gcm.`Country Code`, Null) as Country,
  
  -- Proportionally split amount
  cpc.split_spend as Amount,
  
  -- Static source
  'campaign stats' as Source

FROM campaign_performance_with_countries cpc

-- Join with channel name code map for channel code lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` ccm
  ON ccm.Channel_name = 'MS_Ads' 
  AND ccm.Channel_type = cpc.CampaignType

-- Join with geocode country code map for country code lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map` gcm
  ON gcm.`Name` = cpc.Country

WHERE cpc.Date IS NOT NULL
ORDER BY cpc.Date, cpc.CampaignId, cpc.Country;
