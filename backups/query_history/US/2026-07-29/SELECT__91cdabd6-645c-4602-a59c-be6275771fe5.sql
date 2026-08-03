-- job_id: 91cdabd6-645c-4602-a59c-be6275771fe5
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:40:12.078000+00:00
-- started: 2026-07-29T17:40:12.174000+00:00
-- ended: 2026-07-29T17:40:12.278000+00:00

SELECT Report_Date, App_Name, AFID_CHANNEL, Billing_Cycle, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Churn_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_App_AFID_Channel`
