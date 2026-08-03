-- job_id: c51be101-cbf1-4c8c-8b9d-32555014bc9d
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T16:30:38.169000+00:00
-- started: 2026-07-29T16:30:38.319000+00:00
-- ended: 2026-07-29T16:30:38.406000+00:00

SELECT Report_Date, App_Name, Payment, Billing_Cycle, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Churn_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_App_Payment`
