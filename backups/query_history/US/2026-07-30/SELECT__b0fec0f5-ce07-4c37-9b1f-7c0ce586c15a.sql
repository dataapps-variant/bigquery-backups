-- job_id: b0fec0f5-ce07-4c37-9b1f-7c0ce586c15a
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:31:36.510000+00:00
-- started: 2026-07-30T16:31:36.652000+00:00
-- ended: 2026-07-30T16:31:36.780000+00:00

SELECT Report_Date, Product_Name_Final, Billing_Cycle, Limiting_days, Retry_Engine_Period, Entity_Name, App_Name, Trial_Type, Trial_Period, Regular_BC_period, Country_Code, BC_start_date, BC_end_date, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Gross_ARPU_Retention_Rate, Net_ARPU_Retention_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis`
