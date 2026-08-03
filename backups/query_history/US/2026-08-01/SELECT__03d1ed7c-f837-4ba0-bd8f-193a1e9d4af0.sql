-- job_id: 03d1ed7c-f837-4ba0-bd8f-193a1e9d4af0
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:31:52.413000+00:00
-- started: 2026-08-01T16:31:52.522000+00:00
-- ended: 2026-08-01T16:31:52.665000+00:00

SELECT Report_Date, App_Name, AFID_CHANNEL, Billing_Cycle, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Churn_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_App_AFID_Channel`
