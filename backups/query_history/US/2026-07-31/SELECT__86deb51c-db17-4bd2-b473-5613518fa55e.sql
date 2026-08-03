-- job_id: 86deb51c-db17-4bd2-b473-5613518fa55e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:42:19.175000+00:00
-- started: 2026-07-31T13:42:19.313000+00:00
-- ended: 2026-07-31T13:42:19.352000+00:00

SELECT Reporting_Date, Active_Inactive, BC, App_Name, Country, Subscriptions, Rebills, Single_Sale, Churn_Rate, Refund_Rate, Cumulative_Refund_Rate, Gross_ARPU_Retention_Rate, Net_ARPU_Retention_Rate, Recent_CAC, T30D_New_Users, Daily_Allocated_Spend, Daily_New_Users, Daily_SS_Users, T7D_Daily_SS_Users, T7D_New_Users, Daily_CAC, Gross_ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, BC4_CAC_Ceiling, Cohort, `Table`, T7D_Spend, T7D_CAC_SS, AFID, BC_New_Users FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_App_AFID_Level`
