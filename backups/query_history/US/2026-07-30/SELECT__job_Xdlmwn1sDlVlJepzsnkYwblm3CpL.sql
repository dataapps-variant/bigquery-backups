-- job_id: job_Xdlmwn1sDlVlJepzsnkYwblm3CpL
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:56:44.368000+00:00
-- started: 2026-07-30T09:56:44.469000+00:00
-- ended: 2026-07-30T09:56:45.113000+00:00

SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
where App_Name = "MB"
and Date_of_Sale >= "2026-06-30"
and Billing_Cycle_Updated = 0
