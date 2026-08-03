-- job_id: scheduled_query_6a97a222-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T09:00:12.281000+00:00
-- started: 2026-08-02T09:00:12.566000+00:00
-- ended: 2026-08-02T09:00:15.214000+00:00


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
ORDER BY Report_date DESC, App_Name, AFID_Suffix, Billing_Cycle;
