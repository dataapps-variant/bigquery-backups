-- job_id: job_vBQdt_RYZHrxdPZ4GexfEDmN-iqW
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:06:20.082000+00:00
-- started: 2026-07-29T10:06:20.180000+00:00
-- ended: 2026-07-29T10:06:20.215000+00:00

SELECT Count(DISTINCT(Updated_Cust_ID)) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` 
where Date_of_Sale = "2026-07-26"
and Billing_Cycle = "0"
and AFID_CHANNEL = 40
and App_Name = "PD"
and Final_Order_Status IN ("2","6")
