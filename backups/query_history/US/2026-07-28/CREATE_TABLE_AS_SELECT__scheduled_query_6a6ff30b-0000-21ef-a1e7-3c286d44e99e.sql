-- job_id: scheduled_query_6a6ff30b-0000-21ef-a1e7-3c286d44e99e
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T15:23:07.685000+00:00
-- started: 2026-07-28T15:23:08.186000+00:00
-- ended: 2026-07-28T15:23:10.543000+00:00


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
