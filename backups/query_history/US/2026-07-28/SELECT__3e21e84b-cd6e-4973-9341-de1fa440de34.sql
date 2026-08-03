-- job_id: 3e21e84b-cd6e-4973-9341-de1fa440de34
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:10:11.750000+00:00
-- started: 2026-07-28T15:10:11.856000+00:00
-- ended: 2026-07-28T15:10:11.972000+00:00

SELECT Report_Date, Product_Name_Final, Billing_Cycle, Limiting_days, Retry_Engine_Period, Entity_Name, App_Name, Trial_Type, Trial_Period, Regular_BC_period, Country_Code, BC_start_date, BC_end_date, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Gross_ARPU_Retention_Rate, Net_ARPU_Retention_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis`
