SELECT last_updated, Order_Id,Bill_Country,Bill_Email,Ship_Country,	Date_of_Sale,	Payment,	Campaign_Id,	Customer_Number,	Gateway_Id,	Chargeback_Date,	Product_Name_Final,	Billing_Cycle_Updated,	Plan_Price_Net_of_Tax_USD,	Refund_Date, Refund_Amount_USD FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
where App_Name = "CT"
and AFID_CHANNEL = 1
and Is_Chargeback = "1"
and Chargeback_Date >= "2026-04-15"
and Chargeback_Date <= "2026-05-24"
AND Spend_Country_Code_AFID <> "JP"
GROUP BY last_updated, Order_Id,Bill_Country,Bill_Email,Ship_Country,	Date_of_Sale,	Payment,	Campaign_Id,	Customer_Number,	Gateway_Id,	Chargeback_Date,	Product_Name_Final,	Billing_Cycle_Updated,	Plan_Price_Net_of_Tax_USD,	Refund_Date, Refund_Amount_USD
