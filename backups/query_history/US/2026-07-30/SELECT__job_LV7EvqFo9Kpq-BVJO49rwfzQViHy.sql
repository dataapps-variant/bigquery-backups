-- job_id: job_LV7EvqFo9Kpq-BVJO49rwfzQViHy
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:56:12.328000+00:00
-- started: 2026-07-30T09:56:12.415000+00:00
-- ended: 2026-07-30T09:56:12.452000+00:00

SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
where App_Name = "MB"
and Date_of_Sale >= "2026-07-01"
and Billing_Cycle_Updated = "0"
