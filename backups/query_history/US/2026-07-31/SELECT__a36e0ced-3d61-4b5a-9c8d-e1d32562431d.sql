-- job_id: a36e0ced-3d61-4b5a-9c8d-e1d32562431d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:42:19.186000+00:00
-- started: 2026-07-31T13:42:19.272000+00:00
-- ended: 2026-07-31T13:42:24.932000+00:00

SELECT Reporting_Date, Active_Inactive, BC, App_Name, Country, AFID_Suffix, Subscriptions, Rebills, Single_Sale, Churn_Rate, Refund_Rate, Cumulative_Refund_Rate, Gross_ARPU_Retention_Rate, Net_ARPU_Retention_Rate, Recent_CAC, T30D_New_Users, Daily_Allocated_Spend, Daily_New_Users, Daily_SS_Users, T7D_Daily_SS_Users, Daily_CAC, T7D_New_Users, Gross_ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, BC4_CAC_Ceiling, Cohort, `Table` FROM `variant-finance-data-project.Icarus_Cohort.Final_Table_App_AFID`
