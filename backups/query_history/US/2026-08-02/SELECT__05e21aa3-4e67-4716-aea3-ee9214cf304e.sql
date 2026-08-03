-- job_id: 05e21aa3-4e67-4716-aea3-ee9214cf304e
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T10:32:12.001000+00:00
-- started: 2026-08-02T10:32:12.116000+00:00
-- ended: 2026-08-02T10:32:13.056000+00:00

SELECT Report_Date, App_Name, AFID_CHANNEL, Billing_Cycle, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Churn_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_App_AFID_Channel`
