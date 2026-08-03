-- job_id: scheduled_query_6aa30c59-0000-2548-9a5c-30fd380f88f8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T09:00:25.038000+00:00
-- started: 2026-07-30T09:00:25.568000+00:00
-- ended: 2026-07-30T09:00:26.794000+00:00


CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Refund_Table_App_Level` AS

SELECT
  Report_date,
  Entity_Name,
  App_Name,
  Billing_Cycle,
  SUM(Cohort_final_users) AS Cohort_final_users,
  SUM(Refund_Users) AS Refund_Users,
CASE
  WHEN SUM(Refund_Users) < 30 THEN 0.0
  ELSE COALESCE(SAFE_DIVIDE(SUM(Refund_Users), SUM(Cohort_final_users)), 0.0)
END AS Refund_Ratio
FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
GROUP BY Report_date, Entity_Name, App_Name, Billing_Cycle
ORDER BY Report_date DESC, App_Name, Billing_Cycle;
