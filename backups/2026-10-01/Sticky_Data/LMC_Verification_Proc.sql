CREATE PROCEDURE `variant-finance-data-project`.Sticky_Data.LMC_Verification_Proc()
BEGIN
SELECT count(distinct(Updated_Cust_ID)) FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
where Billing_Cycle_Updated != 0
and Acquisition_Date_Time >= "2025-08-01"
and Acquisition_Date_Time <= "2025-08-31"
and Date_of_Sale >= "2025-10-01"
and Date_of_Sale <= "2025-10-31"
and Product_Name_Final in ("CL2995PT","CL2995YT", "CL2995ST")
;
END;
