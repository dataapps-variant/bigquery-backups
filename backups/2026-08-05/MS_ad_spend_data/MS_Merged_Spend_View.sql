CREATE OR REPLACE VIEW `variant-finance-data-project.MS_ad_spend_data.MS_Merged_Spend_View` AS

--Union all Ad Performance views (ad stats)
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_CL`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_JF`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_AT`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_CN`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_CT`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_EN`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_FS`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_IQ`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_PD`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_final_spend_RT`

UNION ALL

-- Union all Campaign Performance views (campaign stats)
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_CL`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_JF`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_AT`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_CN`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_CT`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_EN`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_FS`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_IQ`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_PD`
UNION ALL
SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_campaigns_final_spend_RT`

ORDER BY Date, App_name, Source;
