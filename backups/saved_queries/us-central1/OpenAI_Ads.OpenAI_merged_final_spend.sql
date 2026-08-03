CREATE OR REPLACE VIEW `variant-finance-data-project.OpenAI_Ads.OpenAI_merged_final_spend`
AS
WITH
  -- Cost per campaign × ad group × URL, with AFID extracted from the URL.
  afid_agg AS (
    SELECT
      Day,
      `Campaign tracking ID`        AS campaign_id,
      `Ad group tracking ID`        AS ad_group_id,
      `Landing Page URL`            AS url,
      CASE
        WHEN REGEXP_CONTAINS(`Landing Page URL`, r'afid=([^&]+)')
          THEN REGEXP_EXTRACT(`Landing Page URL`, r'afid=([^&]+)')
        ELSE NULL
      END                           AS afid,
      SUM(Cost)                     AS url_cost
    FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
    GROUP BY Day, campaign_id, ad_group_id, url, afid
  ),
  -- Campaign name + app name + entity name lookup, sourced from the enriched view.
  campaign_meta AS (
    SELECT DISTINCT
      Day,
      `Campaign tracking ID` AS campaign_id,
      `Campaign name`        AS campaign_name,
      App_Name               AS app_name,
      Entity_Name            AS entity_name
    FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report_enriched`
  ),
  joined_data AS (
    SELECT
      'OpenAI_Ads'                          AS Channel_name,
      a.Day                                 AS Date,
      a.campaign_id,
      'Regular'                             AS Channel_type,
      channel_map.Channel_code,
      cm.app_name                           AS App_name,
      cm.entity_name                        AS Entity_name,
      a.afid                                AS Final_URL_suffix_AFID,
      dim.Country_name                      AS Country,
      'USD'                                 AS Currency,
      CAST(a.url_cost AS FLOAT64)           AS Amount_local,
      'Ad Stats'                            AS Source
    FROM afid_agg a
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` dim
      ON LOWER(a.afid) = LOWER(dim.AFID)
    LEFT JOIN campaign_meta cm
      ON a.Day = cm.Day AND a.campaign_id = cm.campaign_id
    LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_map
      ON channel_map.Channel_name = 'OpenAI_Ads'
      AND channel_map.Channel_type = 'Regular'
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
  CAST(Amount_local AS FLOAT64) AS Amount,
  Source
FROM joined_data
ORDER BY Date DESC, campaign_id;
