-- job_id: scheduled_query_6a6b95a5-0000-2bae-a049-7474463f9b85
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T09:00:07.827000+00:00
-- started: 2026-07-28T09:00:08.310000+00:00
-- ended: 2026-07-28T09:00:09.452000+00:00


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
