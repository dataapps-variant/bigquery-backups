CREATE OR REPLACE VIEW `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_IQ` AS
WITH geographic_country_spend AS (
  SELECT 
    Date,
    CampaignId,
    Country,
    SUM(Spend) as country_spend,
    SUM(SUM(Spend)) OVER (PARTITION BY Date, CampaignId) as total_geographic_spend,
    SUM(Spend) / SUM(SUM(Spend)) OVER (PARTITION BY Date, CampaignId) as spend_ratio
  FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_IQ_GeographicPerformanceDailyReport`
  WHERE Country IS NOT NULL 
    AND Spend > 0
  GROUP BY Date, CampaignId, Country
),
ad_performance_with_countries AS (
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
    ad.Spend * COALESCE(geo.spend_ratio, 1) as split_spend,
    COALESCE(geo.Country, 'Unknown') as Country
  FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_IQ_AdPerformanceDailyReport` ad
  LEFT JOIN geographic_country_spend geo
    ON ad.CampaignId = geo.CampaignId 
    AND ad.Date = geo.Date
)
SELECT 
  'MS_Ads' as Channel_name,
  apc.Date,
  apc.CampaignType as Channel_type,
  COALESCE(ccm.Channel_code, Null) as Channel_code,
  COALESCE(fem.`App_name`, 'IQ') as App_name,
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
  COALESCE(gcm.`Country Code`, Null) as Country,
  apc.split_spend as Amount,
  'ad stats' as Source
FROM ad_performance_with_countries apc
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` ccm
  ON ccm.Channel_name = 'MS_Ads' 
  AND ccm.Channel_type = apc.CampaignType
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map` fem
  ON fem.Final_Url = apc.FinalUrl
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map` gcm
  ON gcm.`Name` = apc.Country
WHERE apc.Date IS NOT NULL
ORDER BY apc.Date, apc.CampaignId, apc.Country;
