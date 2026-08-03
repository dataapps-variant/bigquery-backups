-- job_id: job_mnBTH2MqnSArmnB39DiE9c6tIznq
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:57:28.065000+00:00
-- started: 2026-07-30T09:57:28.158000+00:00
-- ended: 2026-07-30T09:57:28.399000+00:00

SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
where App_Name = "MB"
and Date_of_Sale >= "2026-06-30"
and Billing_Cycle_Updated = 0
and Spend_Country_Code_AFID = "US"
