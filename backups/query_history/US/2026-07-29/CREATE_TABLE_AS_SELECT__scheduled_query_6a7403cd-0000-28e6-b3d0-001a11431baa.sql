-- job_id: scheduled_query_6a7403cd-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T09:00:14.630000+00:00
-- started: 2026-07-29T09:00:15.104000+00:00
-- ended: 2026-07-29T09:00:17.227000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_App` AS

SELECT
  Report_date,
  Entity_Name,
  App_Name,
  AFID,
  Billing_Cycle,
  SUM(Cohort_final_users) AS Cohort_final_users,
  SUM(Refund_Count) AS Refund_Count,
  SUM(Refund_Users) AS Refund_Users,
  CASE
    WHEN SUM(Refund_Count) < 30 THEN 0.0
    ELSE COALESCE(SAFE_DIVIDE(SUM(Refund_Users), SUM(Cohort_final_users)), 0.0)
  END AS Refund_Ratio
FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
GROUP BY Report_date, Entity_Name, App_Name, AFID, Billing_Cycle
ORDER BY Report_date DESC, App_Name, AFID, Billing_Cycle;
