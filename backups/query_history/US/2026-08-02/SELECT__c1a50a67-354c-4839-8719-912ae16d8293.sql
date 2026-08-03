-- job_id: c1a50a67-354c-4839-8719-912ae16d8293
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:31:37.398000+00:00
-- started: 2026-08-02T16:31:37.531000+00:00
-- ended: 2026-08-02T16:31:37.672000+00:00

SELECT Reporting_Date, Plan_Name, Active_Inactive, BC, Entity_Name, App_Name, Trial_Type, Country, Subscriptions, Rebills, Single_Sale, Churn_Rate, Refund_Rate, Gross_ARPU_Retention_Rate, Net_ARPU_Retention_Rate, Cohort_CAC, Recent_CAC, T30D_New_Users, Gross_ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, BC4_CAC_Ceiling, Daily_New_Users, Daily_Spend, Daily_CAC, Cumulative_Refund, Cohort, `Table`, SS_Users_Daily, T7D_SS_Users, T7D_New_Users_Daily FROM `variant-finance-data-project.ICARUS_Multi.Final_Table`
