CREATE VIEW `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_CT`
AS WITH geographic_country_spend AS (
  SELECT 
    Date,
    CampaignId,
    Country,
    SUM(Spend) as country_spend,
    SUM(SUM(Spend)) OVER (PARTITION BY Date, CampaignId) as total_geographic_spend,
    SUM(Spend) / SUM(SUM(Spend)) OVER (PARTITION BY Date, CampaignId) as spend_ratio
  FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CT_GeographicPerformanceDailyReport`
  WHERE Country IS NOT NULL 
    AND Spend > 0
  GROUP BY Date, CampaignId, Country
),

campaign_performance_with_countries AS (
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
    cp.Spend * COALESCE(geo.spend_ratio, 1) as split_spend,
    COALESCE(geo.Country, Null) as Country
  FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CT_CampaignPerformanceDailyReport` cp
  LEFT JOIN geographic_country_spend geo
    ON cp.CampaignId = geo.CampaignId 
    AND cp.Date = geo.Date
  WHERE NOT EXISTS (
    SELECT 1 
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CT_AdPerformanceDailyReport` ap
    WHERE ap.CampaignId = cp.CampaignId 
    AND ap.Date = cp.Date
  )
)

SELECT 
  'MS_Ads' as Channel_name,
  cpc.Date,
  cpc.CampaignType as Channel_type,
  COALESCE(ccm.Channel_code, Null) as Channel_code,
  'CT' as App_name,
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
  COALESCE(gcm.`Country Code`, Null) as Country,
  cpc.split_spend as Amount,
  'campaign stats' as Source
FROM campaign_performance_with_countries cpc
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` ccm
  ON ccm.Channel_name = 'MS_Ads' 
  AND ccm.Channel_type = cpc.CampaignType
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map` gcm
  ON gcm.`Name` = cpc.Country
WHERE cpc.Date IS NOT NULL
ORDER BY cpc.Date, cpc.CampaignId, cpc.Country;
