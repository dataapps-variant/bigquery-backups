CREATE OR REPLACE VIEW `variant-finance-data-project.Yahoo_Ads.Yahoo_merged_final_spend` AS
WITH country_agg AS (
  SELECT
    Day,
    `Campaign tracking ID` AS campaign_id,
    Country,
    SUM(Cost) AS country_cost
  FROM `variant-finance-data-project.Yahoo_Ads.Country`
  GROUP BY Day, campaign_id, Country
),
afid_agg AS (
  SELECT
    Day,
    `Campaign tracking ID` AS campaign_id,
    `Ad group tracking ID` AS ad_group_id,
    `Landing Page URL`     AS url,
    SUM(Cost) AS url_cost
  FROM `variant-finance-data-project.Yahoo_Ads.AFID`
  GROUP BY Day, campaign_id, ad_group_id, url
),
campaign_totals AS (
  SELECT
    Day,
    campaign_id,
    SUM(country_cost) AS cmp_total_cost
  FROM country_agg
  GROUP BY Day, campaign_id
),
campaign_meta AS (
  SELECT DISTINCT
    Day,
    `Campaign tracking ID` AS campaign_id,
    `Campaign name`        AS campaign_name,
    `Campaign type`        AS campaign_type
  FROM `variant-finance-data-project.Yahoo_Ads.Campaign`
)
SELECT
  -- Static field
  'Yahoo_Ads' AS Channel_name,

  -- Direct from base table
  co.Day AS Date,

  -- From Campaign table
  cm.campaign_type AS Channel_type,

  -- Lookup using Channel_name + Channel_type combination
  channel_map.Channel_code,

  -- Static field
  'CT' AS App_name,

  -- Static field
  'CT' AS Entity_name,

  -- URL parsing: extract AFID from Landing Page URL
  CASE
    WHEN REGEXP_CONTAINS(a.url, r'afid=([^&]+)')
    THEN REGEXP_EXTRACT(a.url, r'afid=([^&]+)')
    ELSE a.url
  END AS Final_URL_suffix_AFID,

  -- From Country table
  co.Country,

  -- Proportionally allocated cost
  CAST(SAFE_DIVIDE(co.country_cost * a.url_cost, t.cmp_total_cost) AS FLOAT64) AS Amount,

  -- Static field
  'Ad Stats' AS Source

FROM country_agg co

JOIN afid_agg a
  ON  co.Day         = a.Day
  AND co.campaign_id = a.campaign_id

JOIN campaign_totals t
  ON  co.Day         = t.Day
  AND co.campaign_id = t.campaign_id

LEFT JOIN campaign_meta cm
  ON  co.Day         = cm.Day
  AND co.campaign_id = cm.campaign_id

-- Lookup Channel_code using Channel_name + Channel_type combination
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_map
  ON  channel_map.Channel_name = 'Yahoo_Ads'
  AND channel_map.Channel_type = cm.campaign_type

ORDER BY co.Day DESC, co.campaign_id;
