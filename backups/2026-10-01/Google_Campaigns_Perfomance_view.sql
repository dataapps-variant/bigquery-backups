CREATE OR REPLACE VIEW `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_campaigns_final_spend` AS
SELECT 
    -- Channel_name: Static value
    'Google_Ads' AS Channel_name,
    
    -- Date: From event_date
    cp.event_date AS Date,
    
    -- Channel_type: From campaign_type
    cp.campaign_type AS Channel_type,
    
    -- Channel_code: Lookup based on Channel_name + Channel_type combination
    channel_map.Channel_code AS Channel_code,
    
    -- App_name: Single lookup using external_customer_id (no change)
    cust_map.`App_ name` AS App_name,
    
    -- Final_URL_suffix (AFID): First try final_url_suffix, then asset_group_final_urls
    -- Extract just the value after "afid="
    COALESCE(
        REGEXP_EXTRACT(
            COALESCE(NULLIF(cp.final_url_suffix, ''), cp.asset_group_final_urls), 
            r'afid=([^&]+)'
        ),
        COALESCE(NULLIF(cp.final_url_suffix, ''), cp.asset_group_final_urls)
    ) AS Final_URL_suffix_AFID,
    
    -- Country: Lookup through location_view and geo mapping
    geo_map.`Country Code` AS Country,
    
    -- Amount: Split equally across all locations for the campaign
    cp.cost / COALESCE(loc_count.location_count, 1) AS Amount,
    
    -- Source: Static value for campaign stats
    'campaign stats' AS Source

FROM 
    `variant-finance-data-project.vatiant_finance_Google_Query_Test.campaign_performance` cp

-- LEFT JOIN for Channel_code lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map` channel_map
    ON channel_map.Channel_name = 'Google_Ads' 
    AND channel_map.Channel_type = cp.campaign_type

-- LEFT JOIN for App_name lookup
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_google_custid_appname_map` cust_map
    ON cust_map.external_customer_id = cp.external_customer_id

-- LEFT JOIN for getting ALL targeted_location_ids from location_view
LEFT JOIN `variant-finance-data-project.vatiant_finance_Google_Query_Test.location_view` loc_view
    ON loc_view.campaign_id = cp.campaign_id
    AND loc_view.external_customer_id = cp.external_customer_id

-- LEFT JOIN to get count of locations per campaign for amount splitting
LEFT JOIN (
    SELECT 
        campaign_id,
        external_customer_id,
        COUNT(*) as location_count
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.location_view`
    GROUP BY campaign_id, external_customer_id
) loc_count
    ON loc_count.campaign_id = cp.campaign_id
    AND loc_count.external_customer_id = cp.external_customer_id

-- LEFT JOIN for Country lookup using the 4-digit code
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map` geo_map
    ON CAST(geo_map.`Criteria ID` AS STRING) = loc_view.targeted_location_id

-- IMPORTANT: Exclude campaigns that exist in ad_performance
WHERE NOT EXISTS (
    SELECT 1 
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance` ad
    WHERE ad.campaign_id = cp.campaign_id
    AND ad.external_customer_id = cp.external_customer_id
    AND ad.event_date = cp.event_date
)
