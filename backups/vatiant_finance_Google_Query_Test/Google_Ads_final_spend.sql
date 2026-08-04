CREATE VIEW `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Ads_final_spend`
AS -- Combine historical and daily data with explicit column ordering
WITH combined_ad_data AS (
    -- Historical data (existing table)
    SELECT 
        ad_id,
        adgroup_id,
        event_date,
        external_customer_id,
        account_name,
        campaign_id,
        campaign_type,
        final_url,
        final_url_suffix,
        cost
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance`
    
    UNION ALL
    
    -- Daily data (new table) - reordered to match
    SELECT 
        ad_id,
        adgroup_id,
        event_date,
        external_customer_id,
        account_name,
        campaign_id,
        campaign_type,
        final_url,
        final_url_suffix,
        cost
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance_daily`
)

SELECT 
    -- Channel_name: Static value
    'Google_Ads' AS Channel_name,
    
    -- Date: From event_date
    ad.event_date AS Date,
    
    -- Channel_type: From campaign_type
    ad.campaign_type AS Channel_type,
    
    -- Channel_code: Lookup based on Channel_name + Channel_type combination
    channel_map.Channel_code AS Channel_code,
    
    -- App_name: Two-step lookup process, NULL if both fail
    COALESCE(
        url_map.App_name,        -- First try: lookup by final_url
        cust_map.`App_ name`     -- Second try: lookup by external_customer_id
    ) AS App_name,
    
    -- Final_URL_suffix (AFID): Extract just the value after "afid="
    COALESCE(
        REGEXP_EXTRACT(ad.final_url_suffix, r'afid=([^&]+)'),
        ad.final_url_suffix
    ) AS Final_URL_suffix_AFID,
    
    -- Country: Simplified lookup through location_view and geo mapping
    geo_map.`Country Code` AS Country,
    
    -- Amount: Split equally across all locations for the campaign
    ad.cost / COALESCE(loc_count.location_count, 1) AS Amount,
    
    -- Source: Static value
    'ad stats' AS Source

FROM 
    combined_ad_data ad

-- LEFT JOIN for Channel_code lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_map
    ON channel_map.Channel_name = 'Google_Ads' 
    AND channel_map.Channel_type = ad.campaign_type

-- LEFT JOIN for App_name - Step 1: Try final_url lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map` url_map
    ON url_map.Final_Url = ad.final_url

-- LEFT JOIN for App_name - Step 2: Fallback to customer_id lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_google_custid_appname_map` cust_map
    ON cust_map.external_customer_id = ad.external_customer_id

-- LEFT JOIN for getting ALL targeted_location_ids from location_view
LEFT JOIN `variant-finance-data-project.vatiant_finance_Google_Query_Test.location_view` loc_view
    ON loc_view.campaign_id = ad.campaign_id
    AND loc_view.external_customer_id = ad.external_customer_id

-- LEFT JOIN to get count of locations per campaign for amount splitting
LEFT JOIN (
    SELECT 
        campaign_id,
        external_customer_id,
        COUNT(*) as location_count
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.location_view`
    GROUP BY campaign_id, external_customer_id
) loc_count
    ON loc_count.campaign_id = ad.campaign_id
    AND loc_count.external_customer_id = ad.external_customer_id

-- LEFT JOIN for Country lookup using the 4-digit code
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map` geo_map
    ON CAST(geo_map.`Criteria ID` AS STRING) = loc_view.targeted_location_id;
