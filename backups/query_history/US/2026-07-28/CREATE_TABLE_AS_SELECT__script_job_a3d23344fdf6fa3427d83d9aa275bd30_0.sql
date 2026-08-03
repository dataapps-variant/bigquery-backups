-- job_id: script_job_a3d23344fdf6fa3427d83d9aa275bd30_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T14:54:19.292000+00:00
-- started: 2026-07-28T14:54:19.916000+00:00
-- ended: 2026-07-28T14:54:21.925000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_App_AFID` AS

SELECT
  Report_date,
  Entity_Name,
  App_Name,
  AFID_Suffix,
  Billing_Cycle,
  SUM(Cohort_final_users) AS Cohort_final_users,
  SUM(Refund_Count) AS Refund_Users,
  CASE
  WHEN SUM(Refund_Count) < 30 THEN 0.0
  ELSE COALESCE(SAFE_DIVIDE(SUM(Refund_Count), SUM(Cohort_final_users)), 0.0)
END AS Refund_Ratio
FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
GROUP BY Report_date, Entity_Name, App_Name, AFID_Suffix, Billing_Cycle
ORDER BY Report_date DESC, App_Name, AFID_Suffix, Billing_Cycle
