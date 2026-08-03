-- 1. Connection Test Table Schema
CREATE TABLE IF NOT EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Ads_Connection_Test` (
    test_id STRING NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    manager_account_id STRING,
    client_account_id STRING,
    campaign_id STRING,
    campaign_name STRING,
    campaign_status STRING,
    campaign_type STRING,
    accessible_accounts_count INTEGER,
    campaigns_found INTEGER,
    test_status STRING NOT NULL,
    test_message STRING
)
PARTITION BY DATE(timestamp)
CLUSTER BY client_account_id, campaign_type;

-- 2. Metrics Data Table Schema (for future use with client accounts)
CREATE TABLE IF NOT EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Ads_Geo_Metrics` (
    -- Identifiers
    account_id STRING NOT NULL,
    customer_id STRING NOT NULL,
    campaign_id STRING NOT NULL,
    campaign_name STRING,
    campaign_type STRING,
    ad_group_id STRING,
    
    -- Geographic data
    country_criterion_id INTEGER,
    location_type STRING,
    country_name STRING, -- We can add this by mapping criterion_id
    
    -- Date and timing
    data_date DATE NOT NULL,
    query_timestamp TIMESTAMP NOT NULL,
    
    -- Metrics
    cost_micros INTEGER,
    cost NUMERIC(10,6),
    impressions INTEGER,
    clicks INTEGER,
    ctr NUMERIC(8,6), -- Click-through rate (calculated)
    cpc_micros INTEGER, -- Cost per click in micros
    cpc NUMERIC(8,6), -- Cost per click in currency
    
    -- Metadata
    data_source STRING DEFAULT 'google_ads_api',
    processing_batch_id STRING
)
PARTITION BY data_date
CLUSTER BY customer_id, campaign_type, country_criterion_id;

-- 3. Customer Accounts Table (to track all accessible accounts)
CREATE TABLE IF NOT EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Ads_Customers` (
    manager_account_id STRING NOT NULL,
    customer_id STRING NOT NULL,
    customer_name STRING,
    customer_status STRING,
    account_type STRING, -- 'CLIENT' or 'MANAGER'
    currency_code STRING,
    time_zone STRING,
    last_updated TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
)
CLUSTER BY manager_account_id, customer_id;

-- 4. Country Criterion Lookup Table (for geographic reporting)
CREATE TABLE IF NOT EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Test.Geographic_Criterions` (
    criterion_id INTEGER NOT NULL,
    country_name STRING,
    country_code STRING,
    canonical_name STRING,
    parent_id INTEGER,
    country_type STRING, -- 'COUNTRY', 'REGION', 'CITY', etc.
    is_targeting_location BOOLEAN
)
CLUSTER BY criterion_id;

-- 5. Example queries for analysis

-- View connection test results
SELECT 
    test_id,
    timestamp,
    client_account_id,
    campaigns_found,
    test_status,
    test_message
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Ads_Connection_Test`
WHERE test_status = 'SUCCESS'
ORDER BY timestamp DESC;

-- Example metrics analysis query (for future use)
SELECT 
    m.data_date,
    m.customer_id,
    m.campaign_name,
    g.country_name,
    SUM(m.cost) as total_cost,
    SUM(m.impressions) as total_impressions,
    SUM(m.clicks) as total_clicks,
    SAFE_DIVIDE(SUM(m.clicks), SUM(m.impressions)) * 100 as ctr_percent
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Ads_Geo_Metrics` m
LEFT JOIN `variant-finance-data-project.vatiant_finance_Google_Query_Test.Geographic_Criterions` g
    ON m.country_criterion_id = g.criterion_id
WHERE m.data_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAYS)
GROUP BY 1,2,3,4
ORDER BY total_cost DESC;
