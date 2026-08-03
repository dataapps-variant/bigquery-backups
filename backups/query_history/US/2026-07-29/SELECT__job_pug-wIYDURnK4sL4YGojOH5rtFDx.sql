-- job_id: job_pug-wIYDURnK4sL4YGojOH5rtFDx
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:04:54.467000+00:00
-- started: 2026-07-29T10:04:54.773000+00:00
-- ended: 2026-07-29T10:04:58.610000+00:00

SELECT Count(DISTINCT(Updated_Cust_ID)) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V_W_EC` 
where Date_of_Sale = "2026-07-26"
and Billing_Cycle = "0"
