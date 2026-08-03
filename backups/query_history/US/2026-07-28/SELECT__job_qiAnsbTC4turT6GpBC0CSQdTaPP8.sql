-- job_id: job_qiAnsbTC4turT6GpBC0CSQdTaPP8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:15:26.148000+00:00
-- started: 2026-07-28T10:15:26.252000+00:00
-- ended: 2026-07-28T10:15:26.361000+00:00

SELECT Sum(Order_Price_Net_of_Tax_USD) FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
Where Date_of_Sale <= "2026-05-12"
and Date_of_Sale <= "2026-04-12"
and Billing_Cycle_Updated = 0
and Trial_Type = "SS"
and Product_Name_Final_Main_Merged = "PD4988PTAA"
