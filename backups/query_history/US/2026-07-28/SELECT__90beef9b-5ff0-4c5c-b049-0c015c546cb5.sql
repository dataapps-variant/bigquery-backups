-- job_id: 90beef9b-5ff0-4c5c-b049-0c015c546cb5
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:32:21.991000+00:00
-- started: 2026-07-28T10:32:22.111000+00:00
-- ended: 2026-07-28T10:32:23.003000+00:00

SELECT Report_Date, App_Name, AFID_CHANNEL, Billing_Cycle, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Churn_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_App_AFID_Channel`
