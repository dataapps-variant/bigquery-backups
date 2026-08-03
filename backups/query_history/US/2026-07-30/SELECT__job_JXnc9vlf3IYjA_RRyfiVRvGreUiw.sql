-- job_id: job_JXnc9vlf3IYjA_RRyfiVRvGreUiw
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:58:46.377000+00:00
-- started: 2026-07-30T09:58:46.441000+00:00
-- ended: 2026-07-30T09:58:46.802000+00:00

SELECT Count(DISTINCT(Updated_Cust_ID)) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
where App_Name = "CT"
and Date_of_Sale >= "2026-06-30"
and Billing_Cycle_Updated = 0
and Spend_Country_Code_AFID = "JP"
