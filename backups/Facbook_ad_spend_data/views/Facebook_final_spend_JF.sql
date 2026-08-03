CREATE VIEW `variant-finance-data-project.Facbook_ad_spend_data.Facebook_final_spend_JF`
AS WITH base_data AS (
  -- Get base Facebook ad data
  SELECT 
    fb.DateStart,
    fb.AdId,
    fb.AdName,
    fb.CampaignId,
    fb.CampaignName,
    fb.AccountId,
    fb.AccountName,
    fb.Spend
  FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_DailyAdInsights` fb
),

url_lookup AS (
  -- Add URL information
  SELECT 
    base.DateStart,
    base.AdId,
    base.AdName,
    base.CampaignId,
    base.CampaignName,
    base.AccountId,
    base.AccountName,
    base.Spend,
    url_map.URL as ad_url
  FROM base_data base
  LEFT JOIN `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_URL_map` url_map
    ON base.AdId = url_map.`Ad ID`
),

country_spend_ranked AS (
  -- Rank countries by spend for each AdId
  SELECT 
    country_map.`Ad ID` as AdId,
    country_map.Country,
    country_map.Spend as country_spend,
    MAX(country_map.Spend) OVER (PARTITION BY country_map.`Ad ID`) as max_spend_for_adid,
    ROW_NUMBER() OVER (
      PARTITION BY country_map.`Ad ID` 
      ORDER BY country_map.Spend DESC, country_map.Country ASC
    ) as spend_rank
  FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_Country_Code_map` country_map
),

best_country AS (
  -- Select the best country for each AdId
  SELECT 
    AdId,
    Country as selected_country,
    country_spend as selected_country_spend
  FROM country_spend_ranked
  WHERE spend_rank = 1  -- Take highest spend country, or first alphabetically if all are 0
),

url_with_country AS (
  -- Combine URL data with selected country
  SELECT 
    url.DateStart,
    url.AdId,
    url.AdName,
    url.CampaignId,
    url.CampaignName,
    url.AccountId,
    url.AccountName,
    url.Spend,
    url.ad_url,
    best.selected_country as country_from_map
  FROM url_lookup url
  LEFT JOIN best_country best
    ON url.AdId = best.AdId
),

channel_lookup AS (
  -- Add channel code
  SELECT 
    data_with_country.DateStart,
    data_with_country.AdId,
    data_with_country.AdName,
    data_with_country.CampaignId,
    data_with_country.CampaignName,
    data_with_country.AccountId,
    data_with_country.AccountName,
    data_with_country.Spend,
    data_with_country.ad_url,
    data_with_country.country_from_map,
    channel_dim.Channel_code
  FROM url_with_country data_with_country
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_dim
    ON CONCAT('Facebook_Ads', 'FB_Ads') = CONCAT(channel_dim.Channel_name, channel_dim.Channel_type)
),

final_data AS (
  -- Add app name lookup
  SELECT 
    channel.DateStart,
    channel.AdId,
    channel.AdName,
    channel.CampaignId,
    channel.CampaignName,
    channel.AccountId,
    channel.AccountName,
    channel.Spend,
    channel.ad_url,
    channel.country_from_map,
    channel.Channel_code,
    app_dim.App_name as mapped_app_name
  FROM channel_lookup channel
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map` app_dim
    ON channel.ad_url = app_dim.Final_Url
)

SELECT 
  -- Static fields
  'Facebook_Ads' as Channel_name,
  final.DateStart as Date,
  'FB_Ads' as Channel_type,
  final.Channel_code,
  
  -- App_name: Use mapped value or fallback to 'JF'
  COALESCE(final.mapped_app_name, 'JF') as App_name,
  
  -- Final_URL_suffix_AFID: Extract AFID parameter from URL
  CASE 
    WHEN final.ad_url IS NULL THEN NULL
    WHEN REGEXP_CONTAINS(final.ad_url, r'afid=([^&]+)') THEN 
      REGEXP_EXTRACT(final.ad_url, r'afid=([^&]+)')
    ELSE final.ad_url
  END as Final_URL_suffix_AFID,
  
  -- Country: Handle null and 'unknown' cases
  CASE 
    WHEN final.country_from_map IS NULL THEN NULL
    WHEN LOWER(TRIM(final.country_from_map)) = 'unknown' THEN 'OR'
    ELSE final.country_from_map
  END as Country,
  
  -- Amount: Use full original spend (no distribution)
  final.Spend as Amount,
  
  -- Source: Always 'ad stats'
  'ad stats' as Source

FROM final_data final
WHERE final.DateStart IS NOT NULL
ORDER BY final.DateStart DESC;
