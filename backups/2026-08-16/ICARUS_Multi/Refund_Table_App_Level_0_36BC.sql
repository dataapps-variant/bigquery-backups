CREATE OR REPLACE PROCEDURE `variant-finance-data-project.ICARUS_Multi.proc_Refund_Table_App_Level_0_36BC`()
BEGIN

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Refund_Table_App_Level_0_36BC` AS

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
FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table_0_36BC`
GROUP BY Report_date, Entity_Name, App_Name, Billing_Cycle
ORDER BY Report_date DESC, App_Name, Billing_Cycle;

END;
