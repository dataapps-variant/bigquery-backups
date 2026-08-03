-- job_id: job_M40eUay6Jm1AbHWV0NYeY9gG4OW3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:07:50.151000+00:00
-- started: 2026-07-29T10:07:50.228000+00:00
-- ended: 2026-07-29T10:07:50.567000+00:00

SELECT AFID, AFID_CHANNEL, Count(DISTINCT(Updated_Cust_ID)) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` 
where Date_of_Sale = "2026-07-26"
and Billing_Cycle = "0"
and App_Name = "PD"
and Final_Order_Status IN (2,6)
GROUP BY AFID, AFID_CHANNEL
