-- job_id: scheduled_query_6a8d5a84-0000-2fd9-ad59-30fd3813e120
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T09:00:04.116000+00:00
-- started: 2026-08-01T09:00:04.709000+00:00
-- ended: 2026-08-01T09:00:06.060000+00:00


CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table_App_Level` AS

SELECT
  Report_date,
  Entity_Name,
  App_Name,
  Spend_Country_Code_AFID,
  Billing_Cycle,
  SUM(Cohort_final_users) AS Cohort_final_users,
  SUM(Refund_Users) AS Refund_Users,
  SAFE_DIVIDE(SUM(Refund_Users), SUM(Cohort_final_users)) AS Refund_Ratio
FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
GROUP BY Report_date, Entity_Name, App_Name, Spend_Country_Code_AFID, Billing_Cycle
ORDER BY Report_date DESC, App_Name, Spend_Country_Code_AFID, Billing_Cycle;
