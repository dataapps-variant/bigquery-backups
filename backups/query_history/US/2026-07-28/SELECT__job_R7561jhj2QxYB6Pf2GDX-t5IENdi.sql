-- job_id: job_R7561jhj2QxYB6Pf2GDX-t5IENdi
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:14:56.712000+00:00
-- started: 2026-07-28T10:14:56.794000+00:00
-- ended: 2026-07-28T10:14:56.977000+00:00

SELECT Sum(Order_Price_Net_of_Tax_USD) FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
Where Date_of_Sale <= "2026-05-12"
and Date_of_Sale <= "2026-04-12"
and Billing_Cycle_Updated = 0
and Trial_Type = "SS"
and Product_Name_Final_Main_Merged = "PD4988PTAA"
