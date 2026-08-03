-- job_id: 0dbead0b-5162-41dd-88e0-2f0b2c088599
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T10:31:34.519000+00:00
-- started: 2026-08-01T10:31:34.612000+00:00
-- ended: 2026-08-01T10:31:35.529000+00:00

SELECT Report_Date, Product_Name_Final, Billing_Cycle, Limiting_days, Retry_Engine_Period, Entity_Name, App_Name, Trial_Type, Trial_Period, Regular_BC_period, Country_Code, BC_start_date, BC_end_date, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Gross_ARPU_Retention_Rate, Net_ARPU_Retention_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis`
