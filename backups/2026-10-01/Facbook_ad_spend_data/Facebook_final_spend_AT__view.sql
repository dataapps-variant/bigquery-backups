CREATE VIEW `variant-finance-data-project.Facbook_ad_spend_data.Facebook_final_spend_AT`
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
  FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_DailyAdInsights` fb
),

url_lookup AS (
  -- Add URL information
  SELECT 
    base.*,
    url_map.URL as ad_url
  FROM base_data base
  LEFT JOIN `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_URL_map` url_map
    ON base.AdId = url_map.`Ad ID`
),

country_lookup AS (
  -- Add country information (can create multiple rows per AdId)
  SELECT 
    url.*,
    country_map.Country as country_from_map,
    country_map.Spend as country_spend,
    -- Calculate total spend for this AdId across all countries for proportional distribution
    SUM(country_map.Spend) OVER (PARTITION BY url.AdId) as total_country_spend
  FROM url_lookup url
  LEFT JOIN `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_Country_Code_map` country_map
    ON url.AdId = country_map.`Ad ID`
),

channel_lookup AS (
  -- Add channel code
  SELECT 
    country.*,
    channel_dim.Channel_code
  FROM country_lookup country
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_dim
    ON CONCAT('Facebook_Ads', 'FB_Ads') = CONCAT(channel_dim.Channel_name, channel_dim.Channel_type)
),

app_name_lookup AS (
  -- Use full URL for app name lookup
  SELECT 
    channel.*,
    -- Keep the full URL instead of extracting domain
    channel.ad_url as full_url,
    app_dim.App_name as mapped_app_name
  FROM channel_lookup channel
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map` app_dim
    ON channel.ad_url = app_dim.Final_Url
)

SELECT 
  -- Static fields
  'Facebook_Ads' as Channel_name,
  DateStart as Date,
  'FB_Ads' as Channel_type,
  Channel_code,
  
  -- App_name: Use mapped value or fallback to 'AT'
  COALESCE(mapped_app_name, 'AT') as App_name,
  
  -- Final_URL_suffix_AFID: Extract AFID parameter from URL
  CASE 
    WHEN ad_url IS NULL THEN NULL
    WHEN REGEXP_CONTAINS(ad_url, r'afid=([^&]+)') THEN 
      REGEXP_EXTRACT(ad_url, r'afid=([^&]+)')
    ELSE ad_url
  END as Final_URL_suffix_AFID,
  
  -- Country: Handle null and 'unknown' cases
  CASE 
    WHEN country_from_map IS NULL THEN NULL
    WHEN LOWER(TRIM(country_from_map)) = 'unknown' THEN 'OR'
    ELSE country_from_map
  END as Country,
  
  -- Amount: Distribute spend proportionally if multiple countries exist
  CASE 
    WHEN total_country_spend > 0 AND country_spend IS NOT NULL THEN 
      Spend * (country_spend / total_country_spend)
    ELSE Spend
  END as Amount,
  
  -- Source: Always 'ad stats'
  'ad stats' as Source

FROM app_name_lookup
WHERE DateStart IS NOT NULL
ORDER BY DateStart DESC;
