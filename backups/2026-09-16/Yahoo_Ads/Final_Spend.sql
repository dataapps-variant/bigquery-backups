CREATE OR REPLACE TABLE `variant-finance-data-project.Yahoo_Ads.Final_Spend` AS
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
    `Ad group tracking ID`  AS ad_group_id,
    `Landing Page URL`      AS url,
    REGEXP_EXTRACT(`Landing Page URL`, r"[?&]afid=([^&]+)") AS afid,
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
  co.Day                                                       AS Day,
  co.campaign_id                                               AS CampaignID,
  cm.campaign_name                                             AS Campaign_name,
  cm.campaign_type                                             AS Campaign_type,
  co.Country                                                   AS Country,
  a.ad_group_id                                                AS Ad_Group_ID,
  a.url                                                        AS URL,
  a.afid                                                       AS AFID,
  SAFE_DIVIDE(co.country_cost * a.url_cost, t.cmp_total_cost)  AS Cost
FROM country_agg co
JOIN afid_agg a
  ON  co.Day         = a.Day
  AND co.campaign_id = a.campaign_id
JOIN campaign_totals t
  ON  co.Day         = t.Day
  AND co.campaign_id = t.campaign_id
LEFT JOIN campaign_meta cm
  ON  co.Day         = cm.Day
  AND co.campaign_id = cm.campaign_id;
