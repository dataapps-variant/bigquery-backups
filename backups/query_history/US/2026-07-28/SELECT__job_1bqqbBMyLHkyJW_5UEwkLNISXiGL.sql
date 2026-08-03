-- job_id: job_1bqqbBMyLHkyJW_5UEwkLNISXiGL
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:14:03.451000+00:00
-- started: 2026-07-28T10:14:03.550000+00:00
-- ended: 2026-07-28T10:14:03.820000+00:00

SELECT Sum(Order_Price_Net_of_Tax_USD) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
Where Date_of_Sale <= "2026-05-12"
and Date_of_Sale <= "2026-04-12"
and Billing_Cycle_Updated = 0
and Trial_Type = "SS"
