CREATE VIEW `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
AS SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    Amount,
    Source
FROM 
    `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_Ads_final_spend`

UNION ALL

-- Get all records from the campaign_performance based view (already excludes duplicates)
SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    App_name,
    Final_URL_suffix_AFID,
    Country,
    Amount,
    Source
FROM 
    `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_campaigns_final_spend`;
