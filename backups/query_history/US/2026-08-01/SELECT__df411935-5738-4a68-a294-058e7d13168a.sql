-- job_id: df411935-5738-4a68-a294-058e7d13168a
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:31:52.401000+00:00
-- started: 2026-08-01T16:31:52.490000+00:00
-- ended: 2026-08-01T16:31:52.611000+00:00

SELECT Report_Date, App_Name, Payment, Billing_Cycle, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Churn_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_App_Payment`
