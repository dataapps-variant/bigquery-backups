SELECT count(distinct(Updated_Cust_ID)) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
where Billing_Cycle_Updated != 0
and Acquisition_Date_Time >= "2024-07-01"
and Acquisition_Date_Time <= "2024-07-31"
and Date_of_Sale >= "2024-07-01"
and Date_of_Sale <= "2024-07-31"
and Product_Name_Final in ("JF2788ST", "JF2788AT", "JF2788BT", "JF2788MT","JF2788FT","JF2788HT","JF2788XT")
and Is_Refund = "yes"
