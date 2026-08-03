-- job_id: 80428e81-131c-4894-8c9a-ae6bede32a97
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:32:21.994000+00:00
-- started: 2026-07-28T10:32:22.096000+00:00
-- ended: 2026-07-28T10:32:25.924000+00:00

SELECT Reporting_Date, Plan_Name, Active_Inactive, BC, Entity_Name, App_Name, Trial_Type, Country, Subscriptions, Rebills, Single_Sale, Churn_Rate, Refund_Rate, Gross_ARPU_Retention_Rate, Net_ARPU_Retention_Rate, Cohort_CAC, Recent_CAC, T30D_New_Users, Gross_ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, BC4_CAC_Ceiling, Daily_New_Users, Daily_Spend, Daily_CAC, Cumulative_Refund, Cohort, `Table`, SS_Users_Daily, T7D_SS_Users, T7D_New_Users_Daily FROM `variant-finance-data-project.ICARUS_Multi.Final_Table`
