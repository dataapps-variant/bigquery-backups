CREATE VIEW `variant-finance-data-project.Yahoo_Ads.Yahoo_merged_final_spend`
AS WITH
  country_agg AS (
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
      `Landing Page URL` AS url,
      SUM(Cost) AS url_cost
    FROM `variant-finance-data-project.Yahoo_Ads.AFID`
    GROUP BY Day, campaign_id, ad_group_id, url
  ),
  campaign_totals AS (
    SELECT Day, campaign_id, SUM(country_cost) AS cmp_total_cost
    FROM country_agg
    GROUP BY Day, campaign_id
  ),
  campaign_meta AS (
    SELECT DISTINCT
      Day,
      `Campaign tracking ID` AS campaign_id,
      `Campaign name` AS campaign_name,
      `Campaign type` AS campaign_type,
      Currency AS currency
    FROM `variant-finance-data-project.Yahoo_Ads.Campaign`
  ),
  -- FIX: Resolve FX rate per currency per day BEFORE the main join
  fx_ranked AS (
    SELECT
      Currency,
      Date AS fx_date,
      Value_USD,
      LEAD(Date) OVER (PARTITION BY Currency ORDER BY Date) AS next_fx_date
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
  ),
  campaign_with_fx AS (
    SELECT
      cm.*,
      fx.Value_USD AS FX_rate
    FROM campaign_meta cm
    LEFT JOIN fx_ranked fx
      ON fx.Currency = cm.currency
      AND fx.fx_date <= cm.Day
      AND (fx.next_fx_date > cm.Day OR fx.next_fx_date IS NULL)
  ),
  joined_data AS (
    SELECT
      'Yahoo_Ads' AS Channel_name,
      co.Day AS Date,
      co.campaign_id,
      cmfx.campaign_type AS Channel_type,
      channel_map.Channel_code,
      'CT' AS App_name,
      'CT' AS Entity_name,
      CASE
        WHEN REGEXP_CONTAINS(a.url, r'afid=([^&]+)')
          THEN REGEXP_EXTRACT(a.url, r'afid=([^&]+)')
        ELSE a.url
      END AS Final_URL_suffix_AFID,
      co.Country,
      CAST(
        SAFE_DIVIDE(co.country_cost * a.url_cost, t.cmp_total_cost) AS FLOAT64
      ) AS Amount_local,
      cmfx.FX_rate,
      'Ad Stats' AS Source
    FROM country_agg co
    JOIN afid_agg a
      ON co.Day = a.Day AND co.campaign_id = a.campaign_id
    JOIN campaign_totals t
      ON co.Day = t.Day AND co.campaign_id = t.campaign_id
    LEFT JOIN campaign_with_fx cmfx
      ON co.Day = cmfx.Day AND co.campaign_id = cmfx.campaign_id
    LEFT JOIN
      `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_map
      ON channel_map.Channel_name = 'Yahoo_Ads'
      AND channel_map.Channel_type = cmfx.campaign_type
  )
SELECT
  Channel_name,
  Date,
  Channel_type,
  Channel_code,
  App_name,
  Entity_name,
  Final_URL_suffix_AFID,
  Country,
  CAST(Amount_local * FX_rate AS FLOAT64) AS Amount,
  Source
FROM joined_data
ORDER BY Date DESC, campaign_id;
