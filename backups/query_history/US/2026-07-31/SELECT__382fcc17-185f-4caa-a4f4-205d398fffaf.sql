-- job_id: 382fcc17-185f-4caa-a4f4-205d398fffaf
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:31:54.649000+00:00
-- started: 2026-07-31T10:31:54.750000+00:00
-- ended: 2026-07-31T10:31:55.796000+00:00

SELECT Report_Date, App_Name, Payment, Billing_Cycle, Cohort_Size, Attempted_Users, Approved_Users, Refund_Users, Chargeback_Users, Attempted_Retry_Count, Approved_Retry_Count, Approval_Rate, Attempt_Rate, Net_Retention_Rate, Churn_Rate, Cohort_Size_Avg, Approval_Rate_Avg, Attempt_Rate_Avg, Net_Retention_Rate_Avg FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_App_Payment`
