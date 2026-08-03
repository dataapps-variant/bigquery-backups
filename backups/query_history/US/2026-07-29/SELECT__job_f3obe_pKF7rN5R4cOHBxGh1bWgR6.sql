-- job_id: job_f3obe_pKF7rN5R4cOHBxGh1bWgR6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:07:31.896000+00:00
-- started: 2026-07-29T10:07:31.978000+00:00
-- ended: 2026-07-29T10:07:32.494000+00:00

SELECT AFID, Count(DISTINCT(Updated_Cust_ID)) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` 
where Date_of_Sale = "2026-07-26"
and Billing_Cycle = "0"
and App_Name = "PD"
and Final_Order_Status IN (2,6)
GROUP BY AFID
