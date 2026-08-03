-- job_id: job_2i5c2eDIRzSpRh57zJ3OTQDfGkC7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:05:12.409000+00:00
-- started: 2026-07-29T10:05:12.644000+00:00
-- ended: 2026-07-29T10:05:16.544000+00:00

SELECT Count(DISTINCT(Updated_Cust_ID)) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V_W_EC` 
where Date_of_Sale = "2026-07-26"
and Billing_Cycle = "0"
and AFID_CHANNEL = 40
